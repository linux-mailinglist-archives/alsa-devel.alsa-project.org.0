Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A426F577CE3
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 09:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AE5E17AD;
	Mon, 18 Jul 2022 09:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AE5E17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658130815;
	bh=iIDIU3hXSIH84BWwZ8wM4VrP6r5QoDTEZS0OfknFg54=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BcbwLzOa2glvQJQ8B4aPuB6mfoCv3Ca88uga2b8axyCF+zY1wqxuoftMi9RXSEQ9z
	 WlH21ASRC3lE8GQHy5HD8kjWEplgvU6cBdYZ0IHFuQmCx960vxX3AAAzjA/WXH0d+K
	 dQbsY/4i/ODTiuZLHQiG4y+Uldd7ne9tEvfRtBGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BF73F8055B;
	Mon, 18 Jul 2022 09:51:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CC58F80508; Mon, 18 Jul 2022 09:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL,
 SPOOF_GMAIL_MID,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67C62F80095
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 09:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67C62F80095
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-AgST6BwiNTG9NjgWcQgQBg-1; Mon, 18 Jul 2022 03:21:54 -0400
X-MC-Unique: AgST6BwiNTG9NjgWcQgQBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F8D7811E80;
 Mon, 18 Jul 2022 07:21:53 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69304141511A;
 Mon, 18 Jul 2022 07:21:49 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: torvalds@linux-foundation.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel@ffwll.ch>, mcgrof@kernel.org
Subject: [PATCH] docs: driver-api: firmware: add driver firmware guidelines.
Date: Mon, 18 Jul 2022 17:21:44 +1000
Message-Id: <20220718072144.2699487-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Mon, 18 Jul 2022 09:51:01 +0200
Cc: alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.sf.net,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org
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

I'm cc'ing this quite widely to reach subsystems which use fw a lot.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 Documentation/driver-api/firmware/core.rst    |  1 +
 .../firmware/firmware-usage-guidelines.rst    | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
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
index 000000000000..34d2412e78c6
--- /dev/null
+++ b/Documentation/driver-api/firmware/firmware-usage-guidelines.rst
@@ -0,0 +1,34 @@
+===================
+Firmware Guidelines
+===================
+
+Drivers that use firmware from linux-firmware should attempt to follow
+the rules in this guide.
+
+* Firmware should be versioned with at least a major/minor version. It
+  is suggested that the firmware files in linux-firmware be named with
+  some device specific name, and just the major version. The
+  major/minor/patch versions should be stored in a header in the
+  firmware file for the driver to detect any non-ABI fixes/issues. The
+  firmware files in linux-firmware should be overwritten with the newest
+  compatible major version. Newer major version firmware should remain
+  compatible with all kernels that load that major number.
+
+* Users should *not* have to install newer firmware to use existing
+  hardware when they install a newer kernel.  If the hardware isn't
+  enabled by default or under development, this can be ignored, until
+  the first kernel release that enables that hardware.  This means no
+  major version bumps without the kernel retaining backwards
+  compatibility for the older major versions.  Minor version bumps
+  should not introduce new features that newer kernels depend on
+  non-optionally.
+
+* If a security fix needs lockstep firmware and kernel fixes in order to
+  be successful, then all supported major versions in the linux-firmware
+  repo should be updated with the security fix, and the kernel patches
+  should detect if the firmware is new enough to declare if the security
+  issue is fixed.  All communications around security fixes should point
+  at both the firmware and kernel fixes. If a security fix requires
+  deprecating old major versions, then this should only be done as a
+  last option, and be stated clearly in all communications.
+
-- 
2.36.1

