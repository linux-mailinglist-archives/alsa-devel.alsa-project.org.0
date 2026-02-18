Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mC22JL9OlmmbdgIAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 00:43:59 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA315AFEC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Feb 2026 00:43:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B0A06020D;
	Thu, 19 Feb 2026 00:43:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B0A06020D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1771458238;
	bh=cYkv61fqC/l1L0jX6VHKv4cw7rZRppMxpB7TE69Fl0E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZSf9LIVGZUz+4X8RqtvKIataxW6lhjjxdMEpdh0Le7fodXoxHrk7tUE+sRP4AQ7lQ
	 YyazRVmg1v39E23aLAlCyBuyiBs0K5vHsocDZBXG1w8jnRdWEi8r85hXnMZFH0Fr3s
	 o0fQXJc76TYx3q7eUJ5TjqTYfwwi3BDMgmNOwe4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D46BF805EE; Thu, 19 Feb 2026 00:43:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4790F80579;
	Thu, 19 Feb 2026 00:43:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09BB5F804F2; Thu, 19 Feb 2026 00:41:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1158BF80162
	for <alsa-devel@alsa-project.org>; Thu, 19 Feb 2026 00:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1158BF80162
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PapcGkgS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E153B4372D;
	Wed, 18 Feb 2026 23:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403C6C116D0;
	Wed, 18 Feb 2026 23:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771458072;
	bh=cYkv61fqC/l1L0jX6VHKv4cw7rZRppMxpB7TE69Fl0E=;
	h=From:To:Cc:Subject:Date:From;
	b=PapcGkgSCXyBCRGjlIuuNJwf7trcQZImg78D58SOVcDno3nILuW+IcJvf1GqgMMYe
	 v/9oliQUhblAmHWFNODMvF6kRi5mRkMLgQl0v/h/asb5zg4ScG2h+xHJNvk/uEzqTc
	 vf/iQHJeFEe4yi/Uh/ZkbT95wOUBeva7QsknfJAoDDYwdHidsyoVgT7eE4f7DclYKp
	 dBvP8QDXy4TUWWaYhm2LNZHklf+R/E/XwGl//LpI6Xfgu8TqCNyKGVxKYUYhL60SK4
	 Cu3nT5rMXeCzQfMeVvwAqNfAiMgImhCNp/LABC1qOGqoWrNXacB+MrJ9G1uxFqviZj
	 DtE78HIGh7+pg==
Message-ID: <5ea3e80b81adbf418f63285ac0f0ea8f@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-merge-window
Date: Wed, 18 Feb 2026 23:41:03 +0000
Message-ID-Hash: NQGUAE4P4SIB7C4VZYO2MUIPEARLBYYL
X-Message-ID-Hash: NQGUAE4P4SIB7C4VZYO2MUIPEARLBYYL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQGUAE4P4SIB7C4VZYO2MUIPEARLBYYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+mx:c];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:alsa-devel@alsa-project.org,m:broonie@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[alsa-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38AA315AFEC
X-Rspamd-Action: no action

The following changes since commit f8f774913b4b599169381073f6674e20976e5529:

  ASoC: SOF: ipc4-control: Set correct error code in refresh_bytes_control (2026-02-09 12:27:28 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-merge-window

for you to fetch changes up to 80ca113671a005430207d351cb403c1637106212:

  ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names (2026-02-18 17:12:41 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.0 merge window

A reasonably small set of fixes and quriks that came in during the merge
window, there's one more pending that I'll send tomorrow if you didn't
send a PR already.

----------------------------------------------------------------
Alexandre Ferrieux (1):
      ASoC: codecs: aw88261: Fix erroneous bitmask logic in Awinic init

Claudiu Beznea (1):
      ASoC: renesas: rz-ssi: Fix playback and capture

Gustavo Salvini (1):
      ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M6501RR

Jack Yu (1):
      ASoC: rt721-sdca: Fix issue of fail to detect OMTP jack type

Luca Weiss (1):
      ASoC: qcom: sm8250: Add quinary MI2S support

Mark Brown (1):
      ASoC: Merge up release

Niranjan H Y (1):
      ASoC: tas2783A: add explicit port prepare handling

Shengjiu Wang (4):
      ASoC: dt-bindings: asahi-kasei,ak5558: Reference common DAI properties
      ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
      ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply names
      ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply names

Vijendar Mukunda (2):
      ASoC: amd: acp: Add ACP7.0 match entries for Realtek parts
      ASoC: amd: amd_sdw: add machine driver quirk for Lenovo models

Ziyi Guo (1):
      ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode_put()

 .mailmap                                           |   4 +-
 Documentation/ABI/testing/sysfs-class-tsm          |  10 --
 Documentation/admin-guide/kernel-parameters.txt    |   5 +
 .../bindings/sound/asahi-kasei,ak4458.yaml         |   6 +-
 .../bindings/sound/asahi-kasei,ak5558.yaml         |   9 +-
 .../devicetree/bindings/sound/ti,tlv320aic3x.yaml  |   1 +
 MAINTAINERS                                        |  53 ++++--
 Makefile                                           |   2 +-
 arch/arm/include/asm/string.h                      |   5 +-
 arch/x86/include/asm/kfence.h                      |   7 +-
 arch/x86/include/asm/vmware.h                      |   4 +-
 arch/x86/kvm/irq.c                                 |   3 +-
 arch/x86/kvm/svm/avic.c                            |   4 +-
 arch/x86/kvm/svm/svm.c                             |   2 +
 arch/x86/kvm/vmx/vmx.c                             |   2 +
 arch/x86/kvm/x86.c                                 |  30 ++--
 arch/x86/kvm/x86.h                                 |   2 +
 drivers/android/binder.c                           |  19 ++-
 drivers/android/binder/rust_binderfs.c             |  17 +-
 drivers/android/binder/thread.rs                   | 109 +++++++-----
 drivers/android/binderfs.c                         |   8 +-
 drivers/block/loop.c                               |  45 ++---
 drivers/block/rbd.c                                |  33 ++--
 drivers/crypto/ccp/sev-dev-tsm.c                   |  15 +-
 drivers/firmware/cirrus/cs_dsp.c                   |  37 +++++
 drivers/firmware/cirrus/cs_dsp.h                   |  18 ++
 drivers/firmware/cirrus/test/cs_dsp_test_bin.c     |  22 ++-
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   |  24 ++-
 drivers/firmware/cirrus/test/cs_dsp_test_wmfw.c    |  26 ++-
 .../firmware/cirrus/test/cs_dsp_test_wmfw_error.c  |  24 ++-
 drivers/firmware/cirrus/test/cs_dsp_tests.c        |   1 +
 drivers/gpio/gpio-loongson-64bit.c                 |   2 +-
 drivers/gpio/gpiolib-acpi-core.c                   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   3 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |  37 ++++-
 .../drm/amd/display/dc/dwb/dcn30/dcn30_cm_common.h |   2 +-
 .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   9 +-
 .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  18 +-
 .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  16 +-
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c       |  15 ++
 drivers/gpu/drm/gma500/psb_irq.c                   |  36 ++--
 drivers/gpu/drm/mgag200/mgag200_bmc.c              |  31 ++--
 drivers/gpu/drm/mgag200/mgag200_drv.h              |   6 +
 drivers/gpu/drm/nouveau/include/nvif/client.h      |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/driver.h      |   2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/device.h |   3 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/engine.h |   2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/object.h |   5 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/oproxy.h |   2 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h |   4 +-
 .../drm/nouveau/include/nvkm/core/suspend_state.h  |  11 ++
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h  |   6 +
 drivers/gpu/drm/nouveau/nouveau_display.c          |   2 -
 drivers/gpu/drm/nouveau/nouveau_drm.c              |   2 +-
 drivers/gpu/drm/nouveau/nouveau_nvif.c             |  10 +-
 drivers/gpu/drm/nouveau/nvif/client.c              |   4 +-
 drivers/gpu/drm/nouveau/nvkm/core/engine.c         |   4 +-
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c          |   4 +-
 drivers/gpu/drm/nouveau/nvkm/core/object.c         |  20 ++-
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/core/subdev.c         |  18 +-
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c         |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h      |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c  |  22 ++-
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c   |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h  |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c  |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c    |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c       |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |   6 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c      |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c      |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c      |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c      |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.h      |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c      |   4 +-
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sec2/base.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/xtensa.c       |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/base.c |   4 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/base.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/user.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h     |   8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |   8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  |   6 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c |   8 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/base.c     |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c   |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c   |   2 +-
 drivers/gpu/drm/xe/xe_guc.c                        |   6 +-
 drivers/gpu/drm/xe/xe_guc.h                        |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c                    |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                         |  13 +-
 drivers/gpu/drm/xe/xe_query.c                      |   2 +-
 drivers/gpu/drm/xe/xe_tlb_inval.c                  |   2 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c              |   2 +-
 drivers/hwmon/acpi_power_meter.c                   |  17 +-
 drivers/hwmon/dell-smm-hwmon.c                     |   8 +
 drivers/hwmon/gpio-fan.c                           |   6 +-
 drivers/hwmon/occ/common.c                         |   1 +
 drivers/i2c/busses/i2c-imx.c                       |   3 +-
 drivers/iommu/intel/pasid.h                        |   2 +-
 drivers/net/ethernet/adi/adin1110.c                |   3 +
 drivers/net/ethernet/cavium/liquidio/lio_main.c    |  39 ++---
 drivers/net/ethernet/cavium/liquidio/lio_vf_main.c |   4 +-
 .../net/ethernet/freescale/dpaa2/dpaa2-switch.c    |  10 ++
 drivers/net/ethernet/freescale/enetc/enetc.c       |  11 +-
 drivers/net/ethernet/freescale/enetc/enetc4_pf.c   |   6 +-
 drivers/net/ethernet/freescale/enetc/enetc_cbdr.c  |   4 -
 drivers/net/ethernet/freescale/enetc/enetc_hw.h    |  17 +-
 drivers/net/ethernet/google/gve/gve_ethtool.c      |  77 ++++++---
 drivers/net/ethernet/google/gve/gve_main.c         |   4 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c        |   1 -
 drivers/net/ethernet/intel/ice/ice_main.c          |  26 +--
 drivers/net/ethernet/intel/ice/ice_ptp.c           | 179 ++++++++++++--------
 drivers/net/ethernet/intel/ice/ice_ptp.h           |  18 +-
 drivers/net/ethernet/spacemit/k1_emac.c            |  21 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
 drivers/net/ethernet/ti/cpsw.c                     |  41 ++++-
 drivers/net/ethernet/ti/cpsw_new.c                 |  34 +++-
 drivers/net/ethernet/ti/cpsw_priv.h                |   1 +
 drivers/net/macvlan.c                              |   5 +-
 drivers/net/phy/sfp.c                              |   2 +
 drivers/net/usb/r8152.c                            |  29 ++--
 drivers/net/wireless/intel/iwlwifi/mld/iface.c     |   2 -
 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c  |   2 +
 drivers/net/wireless/intel/iwlwifi/mvm/d3.c        |   6 +-
 drivers/nvme/host/pci.c                            |  45 +++--
 drivers/nvme/target/tcp.c                          |  17 ++
 drivers/pci/ide.c                                  |  10 +-
 drivers/platform/x86/amd/pmc/pmc-quirks.c          |   7 +
 drivers/platform/x86/classmate-laptop.c            |  32 ++++
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       |   5 +
 drivers/platform/x86/intel/plr_tpmi.c              |   2 +-
 drivers/platform/x86/intel/telemetry/debugfs.c     |   4 +-
 drivers/platform/x86/intel/telemetry/pltdrv.c      |   2 +-
 drivers/platform/x86/intel/vsec.c                  |   2 +
 drivers/platform/x86/lg-laptop.c                   |  11 +-
 drivers/platform/x86/panasonic-laptop.c            |   4 +-
 drivers/platform/x86/toshiba_haps.c                |   2 +-
 drivers/pmdomain/imx/gpcv2.c                       |   8 +-
 drivers/pmdomain/imx/imx8m-blk-ctrl.c              |   2 +-
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c             |  30 ++++
 drivers/pmdomain/qcom/rpmpd.c                      |   2 +-
 drivers/regulator/spacemit-p1.c                    |   6 +-
 drivers/soc/qcom/smem.c                            |   5 +-
 drivers/spi/spi-tegra114.c                         |   3 +
 drivers/spi/spi-tegra20-slink.c                    |   6 +-
 drivers/spi/spi-tegra210-quad.c                    |  56 ++++++-
 drivers/usb/gadget/function/f_fs.c                 | 108 ++++++------
 drivers/usb/gadget/function/u_fs.h                 |   2 +-
 drivers/virt/coco/tsm-core.c                       |  30 ----
 fs/btrfs/raid56.c                                  |   1 +
 fs/ceph/crypto.c                                   |   9 +-
 fs/ceph/mds_client.c                               |   5 +-
 fs/ceph/mdsmap.c                                   |  26 ++-
 fs/ceph/mdsmap.h                                   |   1 +
 fs/ceph/super.h                                    |  16 +-
 fs/proc/task_mmu.c                                 |  42 +++--
 fs/smb/client/cifstransport.c                      |   4 +-
 fs/smb/client/smb2file.c                           |   1 +
 include/linux/buildid.h                            |   3 +
 include/linux/ceph/ceph_fs.h                       |   6 +
 include/linux/livepatch.h                          |   3 +
 include/linux/pci-ide.h                            |   4 +-
 include/linux/rseq_types.h                         |   6 +-
 include/linux/skbuff.h                             |  12 ++
 include/linux/tsm.h                                |   3 -
 include/trace/events/dma.h                         |  25 ++-
 io_uring/fdinfo.c                                  |  13 +-
 io_uring/zcrx.c                                    |   9 +-
 kernel/cgroup/dmem.c                               |  70 +++++++-
 kernel/dma/contiguous.c                            |  10 +-
 kernel/livepatch/core.c                            |  19 +++
 kernel/liveupdate/luo_file.c                       |   2 -
 kernel/sched/core.c                                | 184 ++++++++++++++-------
 kernel/sched/ext.c                                 |  48 ++++++
 kernel/sched/sched.h                               |  44 ++++-
 kernel/trace/trace.h                               |   7 +-
 kernel/trace/trace_entries.h                       |  32 ++--
 kernel/trace/trace_export.c                        |  21 ++-
 lib/buildid.c                                      |  42 +++--
 mm/memory-failure.c                                |  42 +++--
 mm/shmem.c                                         |  23 ++-
 mm/slub.c                                          |   6 +-
 net/core/filter.c                                  |   8 +-
 net/core/gro.c                                     |   2 +
 net/core/link_watch.c                              |  20 ++-
 net/core/net-procfs.c                              |  50 ++++--
 net/ethtool/common.c                               |   3 -
 net/ethtool/rss.c                                  |   9 +-
 net/ipv6/ip6_fib.c                                 |   3 +-
 net/netfilter/nf_tables_api.c                      |   2 +-
 net/sched/cls_u32.c                                |  13 +-
 net/tipc/crypto.c                                  |   4 +-
 scripts/livepatch/init.c                           |  20 +--
 scripts/livepatch/klp-build                        |   4 +
 scripts/module.lds.S                               |   9 +-
 security/lsm.h                                     |   9 -
 security/lsm_init.c                                |   7 +-
 security/min_addr.c                                |   5 +-
 sound/drivers/aloop.c                              |  62 ++++---
 sound/hda/codecs/realtek/alc269.c                  |   1 +
 sound/soc/amd/acp/acp-sdw-legacy-mach.c            |  16 ++
 sound/soc/amd/acp/amd-acp70-acpi-match.c           |  37 +++++
 sound/soc/amd/renoir/acp3x-pdm-dma.c               |   2 +
 sound/soc/amd/yc/acp6x-mach.c                      |  15 +-
 sound/soc/codecs/aw88261.c                         |   3 +-
 sound/soc/codecs/cs42l43-jack.c                    |  37 ++++-
 sound/soc/codecs/rt1320-sdw.c                      |   2 +
 sound/soc/codecs/rt721-sdca.c                      |   4 +-
 sound/soc/codecs/tas2783-sdw.c                     |  43 +++++
 sound/soc/intel/boards/sof_es8336.c                |   9 +
 sound/soc/qcom/sm8250.c                            |   8 +
 sound/soc/renesas/rz-ssi.c                         |   2 +-
 sound/soc/sof/intel/hda.c                          |   5 +-
 sound/usb/mixer_quirks.c                           |   9 +-
 tools/objtool/check.c                              |   4 +-
 tools/objtool/include/objtool/klp.h                |  10 +-
 tools/objtool/klp-diff.c                           |  41 ++++-
 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 tools/testing/selftests/net/udpgro_fwd.sh          |  64 +++++++
 virt/kvm/eventfd.c                                 |  44 ++---
 242 files changed, 2262 insertions(+), 1072 deletions(-)
 create mode 100644 drivers/firmware/cirrus/cs_dsp.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/suspend_state.h
