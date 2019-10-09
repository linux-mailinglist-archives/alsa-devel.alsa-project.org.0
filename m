Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E8D157A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 19:23:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A4941674;
	Wed,  9 Oct 2019 19:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A4941674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570641824;
	bh=fI+F3vMnO9mAtT93iC9VKcokST7+e5WEP+gcyGKaZL4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=NphOVMhisibKpGbZeC9rgW4JY9juxsOPekCZRkRi8qlF61fLcMwgMsIf3RBAee5Ip
	 J2Jr3UqlOqa2O2QGgAgjqtH67g8RiBBjAQuJumrB04y8jIo3cm8MX0Ww2k9iJW7NHL
	 VOPQOZjX6HWFSrg3gSSv0YeE1iSs1noLfKsyHcUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32ED5F802BD;
	Wed,  9 Oct 2019 19:22:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED9CEF80308; Wed,  9 Oct 2019 19:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D515F800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 19:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D515F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="W3atcQgx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IxAhdgaQrq0J/VgaJk4Li88x6ZuphvJhRzy9YVZATI4=; b=W3atcQgxz0VK
 qgwUx5C1pL778u1fRvJ9j/go4rghn/bptabdJwPMJmvuyM7Vzkp62SQGGbye3VAobT7d9+r8qije7
 /XUiFec4C+pAbueudkV6i9q9LykahBuQXmZZLBP4RuQ4lCQkFItbejvf4fyl0LLbXJrg+vnmw2Npk
 UQpuw=;
Received: from 188.31.199.195.threembb.co.uk ([188.31.199.195]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIFer-0005Jq-Jg; Wed, 09 Oct 2019 17:21:54 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 59243D03ED4; Wed,  9 Oct 2019 18:21:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20191008181517.5332-1-dmurphy@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20191009172148.59243D03ED4@fitzroy.sirena.org.uk>
Date: Wed,  9 Oct 2019 18:21:48 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, navada@ti.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoc: Add Texas Instruments TAS2562 amplifier
	binding" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoc: Add Texas Instruments TAS2562 amplifier binding

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From ac84b8b21b8e305b82d2b204999ee3140990d1b5 Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Tue, 8 Oct 2019 13:15:16 -0500
Subject: [PATCH] ASoc: Add Texas Instruments TAS2562 amplifier binding

Add the DT binding for the TAS2562 amplifier.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20191008181517.5332-1-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/tas2562.txt     | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt

diff --git a/Documentation/devicetree/bindings/sound/tas2562.txt b/Documentation/devicetree/bindings/sound/tas2562.txt
new file mode 100644
index 000000000000..658e1fb18a99
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2562.txt
@@ -0,0 +1,34 @@
+Texas Instruments TAS2562 Smart PA
+
+The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
+efficiently driving high peak power into small loudspeakers.
+Integrated speaker voltage and current sense provides for
+real time monitoring of loudspeaker behavior.
+
+Required properties:
+ - #address-cells  - Should be <1>.
+ - #size-cells     - Should be <0>.
+ - compatible:	   - Should contain "ti,tas2562".
+ - reg:		   - The i2c address. Should be 0x4c, 0x4d, 0x4e or 0x4f.
+ - ti,imon-slot-no:- TDM TX current sense time slot.
+
+Optional properties:
+- interrupt-parent: phandle to the interrupt controller which provides
+                    the interrupt.
+- interrupts: (GPIO) interrupt to which the chip is connected.
+- shut-down: GPIO used to control the state of the device.
+
+Examples:
+tas2562@4c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "ti,tas2562";
+        reg = <0x4c>;
+
+        interrupt-parent = <&gpio1>;
+        interrupts = <14>;
+
+	shut-down = <&gpio1 15 0>;
+        ti,imon-slot-no = <0>;
+};
+
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
