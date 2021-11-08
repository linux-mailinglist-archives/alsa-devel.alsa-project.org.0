Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD744985E
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 16:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3B4168A;
	Mon,  8 Nov 2021 16:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3B4168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636385581;
	bh=zrUd98/053hjV+ji0/lYfiUdzrxkVU1MZTFtdraPcmk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dM65vNRILlgsm3vdWXf/7PSq//4RrzWXeI7dVAOd7B1ivszA78BQkvzNdhbopdrBQ
	 SCvD97E1eozOAvizsPgrB2TIuHm9KeVjKJCmj2m12QqpNpJ0+m90So7SyUOFjAdI/y
	 XHAFWqUmCzI/FYqI72v//EYH1H5IhneKRZ6mXgyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 603A7F804FC;
	Mon,  8 Nov 2021 16:30:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 326ECF80107; Mon,  8 Nov 2021 11:19:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC74CF80107
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 11:19:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC74CF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=alien8.de header.i=@alien8.de
 header.b="OmXDZQiN"
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 295D81EC04E0;
 Mon,  8 Nov 2021 11:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636366768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CDGB0dpLCqhyN2VLkOyFdq64uDUd6G/RUsDL3dC+Ipo=;
 b=OmXDZQiNXAykW6msgQxQV2D3jyNeh8L8Ur0LKSqcBbS8Z5Dq+lMoh+uc1KE9lZoNFhTNi5
 HSfl5kEDRsOkXKmO9qqEW67WUQUsv5GaQK9Erwx9IjY3o31Y8ehQnIfkizrSs0P3bzV/5j
 Fq9nLmulJEIgHjmCW/c8QaecUsrUi0U=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v0 00/42] notifiers: Return an error when callback is already
 registered
Date: Mon,  8 Nov 2021 11:19:24 +0100
Message-Id: <20211108101924.15759-1-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Nov 2021 16:29:18 +0100
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-fbdev@vger.kernel.org, netdev@vger.kernel.org,
 Ayush Sawal <ayush.sawal@chelsio.com>, sparclinux@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev,
 bcm-kernel-feedback-list@broadcom.com, xen-devel@lists.xenproject.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
 linux-tegra@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 intel-gvt-dev@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Borislav Petkov <bp@suse.de>

Hi all,

this is a huge patchset for something which is really trivial - it
changes the notifier registration routines to return an error value
if a notifier callback is already present on the respective list of
callbacks. For more details scroll to the last patch.

Everything before it is converting the callers to check the return value
of the registration routines and issue a warning, instead of the WARN()
notifier_chain_register() does now.

Before the last patch has been applied, though, that checking is a
NOP which would make the application of those patches trivial - every
maintainer can pick a patch at her/his discretion - only the last one
enables the build warnings and that one will be queued only after the
preceding patches have all been merged so that there are no build
warnings.

Due to the sheer volume of the patches, I have addressed the respective
patch and the last one, which enables the warning, with addressees for
each maintained area so as not to spam people unnecessarily.

If people prefer I carry some through tip, instead, I'll gladly do so -
your call.

And, if you think the warning messages need to be more precise, feel
free to adjust them before committing.

Thanks!

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rohit Maheshwari <rohitm@chelsio.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com> 
Cc: alsa-devel@alsa-project.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-edac@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-usb@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: netdev@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: rcu@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org

Borislav Petkov (42):
  x86: Check notifier registration return value
  xen/x86: Check notifier registration return value
  impi: Check notifier registration return value
  clk: renesas: Check notifier registration return value
  dca: Check notifier registration return value
  firmware: Check notifier registration return value
  drm/i915: Check notifier registration return value
  Drivers: hv: vmbus: Check notifier registration return value
  iio: proximity: cros_ec: Check notifier registration return value
  leds: trigger: Check notifier registration return value
  misc: Check notifier registration return value
  ethernet: chelsio: Check notifier registration return value
  power: reset: Check notifier registration return value
  remoteproc: Check notifier registration return value
  scsi: target: Check notifier registration return value
  USB: Check notifier registration return value
  drivers: video: Check notifier registration return value
  drivers/xen: Check notifier registration return value
  kernel/hung_task: Check notifier registration return value
  rcu: Check notifier registration return value
  tracing: Check notifier registration return value
  net: fib_notifier: Check notifier registration return value
  ASoC: soc-jack: Check notifier registration return value
  staging: olpc_dcon: Check notifier registration return value
  arch/um: Check notifier registration return value
  alpha: Check notifier registration return value
  bus: brcmstb_gisb: Check notifier registration return value
  soc: bcm: brcmstb: pm: pm-arm: Check notifier registration return
    value
  arm64: Check notifier registration return value
  soc/tegra: Check notifier registration return value
  parisc: Check notifier registration return value
  macintosh/adb: Check notifier registration return value
  mips: Check notifier registration return value
  powerpc: Check notifier registration return value
  sh: Check notifier registration return value
  s390: Check notifier registration return value
  sparc: Check notifier registration return value
  xtensa: Check notifier registration return value
  crypto: ccree - check notifier registration return value
  EDAC/altera: Check notifier registration return value
  power: supply: ab8500: Check notifier registration return value
  notifier: Return an error when callback is already registered

 arch/alpha/kernel/setup.c                     |  5 +--
 arch/arm64/kernel/setup.c                     |  6 ++--
 arch/mips/kernel/relocate.c                   |  6 ++--
 arch/mips/sgi-ip22/ip22-reset.c               |  4 ++-
 arch/mips/sgi-ip32/ip32-reset.c               |  4 ++-
 arch/parisc/kernel/pdc_chassis.c              |  5 +--
 arch/powerpc/kernel/setup-common.c            | 12 ++++---
 arch/s390/kernel/ipl.c                        |  4 ++-
 arch/s390/kvm/kvm-s390.c                      |  7 ++--
 arch/sh/kernel/cpu/sh4a/setup-sh7724.c        | 11 +++---
 arch/sparc/kernel/sstate.c                    |  6 ++--
 arch/um/drivers/mconsole_kern.c               |  6 ++--
 arch/um/kernel/um_arch.c                      |  5 +--
 arch/x86/kernel/cpu/mce/core.c                |  3 +-
 arch/x86/kernel/cpu/mce/dev-mcelog.c          |  3 +-
 arch/x86/kernel/setup.c                       |  7 ++--
 arch/x86/xen/enlighten.c                      |  4 ++-
 arch/xtensa/platforms/iss/setup.c             |  3 +-
 drivers/bus/brcmstb_gisb.c                    |  6 ++--
 drivers/char/ipmi/ipmi_msghandler.c           |  3 +-
 drivers/clk/renesas/clk-div6.c                |  4 ++-
 drivers/clk/renesas/rcar-cpg-lib.c            |  4 ++-
 drivers/crypto/ccree/cc_fips.c                |  4 ++-
 drivers/dca/dca-core.c                        |  3 +-
 drivers/edac/altera_edac.c                    |  6 ++--
 drivers/firmware/arm_scmi/notify.c            |  3 +-
 drivers/firmware/google/gsmi.c                |  6 ++--
 drivers/gpu/drm/i915/gvt/scheduler.c          |  6 ++--
 drivers/hv/vmbus_drv.c                        |  4 +--
 .../iio/proximity/cros_ec_mkbp_proximity.c    |  3 +-
 drivers/leds/trigger/ledtrig-activity.c       |  6 ++--
 drivers/leds/trigger/ledtrig-heartbeat.c      |  6 ++--
 drivers/leds/trigger/ledtrig-panic.c          |  4 +--
 drivers/macintosh/adbhid.c                    |  4 +--
 drivers/misc/ibmasm/heartbeat.c               |  3 +-
 drivers/misc/pvpanic/pvpanic.c                |  3 +-
 .../chelsio/inline_crypto/chtls/chtls_main.c  |  5 ++-
 drivers/parisc/power.c                        |  5 +--
 drivers/power/reset/ltc2952-poweroff.c        |  6 ++--
 drivers/power/supply/ab8500_charger.c         |  8 ++---
 drivers/remoteproc/qcom_common.c              |  3 +-
 drivers/remoteproc/qcom_sysmon.c              |  4 ++-
 drivers/remoteproc/remoteproc_core.c          |  4 ++-
 drivers/s390/char/con3215.c                   |  5 ++-
 drivers/s390/char/con3270.c                   |  5 ++-
 drivers/s390/char/sclp_con.c                  |  4 ++-
 drivers/s390/char/sclp_vt220.c                |  4 ++-
 drivers/s390/char/zcore.c                     |  4 ++-
 drivers/soc/bcm/brcmstb/pm/pm-arm.c           |  5 +--
 drivers/soc/tegra/ari-tegra186.c              |  7 ++--
 drivers/staging/olpc_dcon/olpc_dcon.c         |  4 ++-
 drivers/target/tcm_fc/tfc_conf.c              |  4 ++-
 drivers/usb/core/notify.c                     |  3 +-
 drivers/video/console/dummycon.c              |  3 +-
 drivers/video/fbdev/hyperv_fb.c               |  5 +--
 drivers/xen/manage.c                          |  3 +-
 drivers/xen/xenbus/xenbus_probe.c             |  8 +++--
 include/linux/notifier.h                      |  8 ++---
 kernel/hung_task.c                            |  3 +-
 kernel/notifier.c                             | 36 ++++++++++---------
 kernel/rcu/tree_stall.h                       |  4 ++-
 kernel/trace/trace.c                          |  4 +--
 net/core/fib_notifier.c                       |  4 ++-
 sound/soc/soc-jack.c                          |  3 +-
 64 files changed, 222 insertions(+), 118 deletions(-)

-- 
2.29.2

