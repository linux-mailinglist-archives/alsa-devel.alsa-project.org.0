Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F457C3A1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 06:45:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC80E170B;
	Thu, 21 Jul 2022 06:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC80E170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658378722;
	bh=uj/MaB/VuU2iqSNNkwyBr1v0PLkNKeOdlE4KPbCJK4U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=awsi9JVZ0uh19hjpKub+zlmNJVBFJgfirEnC6BziCN4Z+gLCUAtwY/0Lsd78kvTTC
	 h1ufyPxhBr+zqq/EykyQCh7ZnrIBIS51HfvdQC1AwBE4v1gfy0Gs9L66b60ePKfAXa
	 aeWfQ51sf/0sXlYSQo34dIHn0ixeYwSuSTF8yiFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3892BF80256;
	Thu, 21 Jul 2022 06:44:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC0B2F8016D; Thu, 21 Jul 2022 06:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL,
 SPOOF_GMAIL_MID,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E44E5F800ED
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 06:44:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E44E5F800ED
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-wCWCKbzDPBOPH_d9xnmbWw-1; Thu, 21 Jul 2022 00:44:01 -0400
X-MC-Unique: wCWCKbzDPBOPH_d9xnmbWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80331811E80;
 Thu, 21 Jul 2022 04:44:00 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEEA3909FF;
 Thu, 21 Jul 2022 04:43:55 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: torvalds@linux-foundation.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, mcgrof@kernel.org
Subject: [PATCH] docs: driver-api: firmware: add driver firmware guidelines.
 (v3)
Date: Thu, 21 Jul 2022 14:43:52 +1000
Message-Id: <20220721044352.3110507-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 dri-devel@lists.sf.net, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, linux-media@vger.kernel.org
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

From: Dave Airlie <airlied@redhat.com>

A recent snafu where Intel ignored upstream feedback on a firmware
change, led to a late rc6 fix being required. In order to avoid this
in the future we should document some expectations around
linux-firmware.

I was originally going to write this for drm, but it seems quite generic
advice.

v2: rewritten with suggestions from Thorsten Leemhuis
v3: rewritten with suggestions from Mauro

Acked-by: Luis Chamberlain <mcgrof@kernel.org>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/driver-api/firmware/core.rst    |  1 +
 .../firmware/firmware-usage-guidelines.rst    | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/driver-api/firmware/firmware-usage-guidelines.rst

diff --git a/Documentation/driver-api/firmware/core.rst b/Documentation/driver-api/firmware/core.rst
index 1d1688cbc078..803cd574bbd7 100644
--- a/Documentation/driver-api/firmware/core.rst
+++ b/Documentation/driver-api/firmware/core.rst
@@ -13,4 +13,5 @@ documents these features.
    direct-fs-lookup
    fallback-mechanisms
    lookup-order
+   firmware-usage-guidelines
 
diff --git a/Documentation/driver-api/firmware/firmware-usage-guidelines.rst b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
new file mode 100644
index 000000000000..fdcfce42c6d2
--- /dev/null
+++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
@@ -0,0 +1,44 @@
+===================
+Firmware Guidelines
+===================
+
+Users switching to a newer kernel should *not* have to install newer
+firmware files to keep their hardware working. At the same time updated
+firmware files must not cause any regressions for users of older kernel
+releases.
+
+Drivers that use firmware from linux-firmware should follow the rules in
+this guide. (Where there is limited control of the firmware,
+i.e. company doesn't support Linux, firmwares sourced from misc places,
+then of course these rules will not apply strictly.)
+
+* Firmware files shall be designed in a way that it allows checking for
+  firmware ABI version changes. It is recommended that firmware files be
+  versioned with at least a major/minor version. It is suggested that
+  the firmware files in linux-firmware be named with some device
+  specific name, and just the major version. The firmware version should
+  be stored in the firmware header, or as an exception, as part of the
+  firmware file name, in order to let the driver detact any non-ABI
+  fixes/changes. The firmware files in linux-firmware should be
+  overwritten with the newest compatible major version. Newer major
+  version firmware shall remain compatible with all kernels that load
+  that major number.
+
+* If the kernel support for the hardware is normally inactive, or the
+  hardware isn't available for public consumption, this can
+  be ignored, until the first kernel release that enables that hardware.
+  This means no major version bumps without the kernel retaining
+  backwards compatibility for the older major versions.  Minor version
+  bumps should not introduce new features that newer kernels depend on
+  non-optionally.
+
+* If a security fix needs lockstep firmware and kernel fixes in order to
+  be successful, then all supported major versions in the linux-firmware
+  repo that are required by currently supported stable/LTS kernels,
+  should be updated with the security fix. The kernel patches should
+  detect if the firmware is new enough to declare if the security issue
+  is fixed.  All communications around security fixes should point at
+  both the firmware and kernel fixes. If a security fix requires
+  deprecating old major versions, then this should only be done as a
+  last option, and be stated clearly in all communications.
+
-- 
2.36.1

