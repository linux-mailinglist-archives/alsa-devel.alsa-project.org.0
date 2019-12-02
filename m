Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1910EEC1
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 18:51:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5F2166C;
	Mon,  2 Dec 2019 18:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5F2166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575309076;
	bh=mhtSeAIgqzjxMdBkTFHeQOK35cOb8mj/T5jKfoUXsAI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIMhrQl/9p3JfXdRcQrIEEoNFxo68+xq8AwVwD1qaKvDl5waIPItcz6qBb2qjbrQc
	 Di2gAlxm5eseudFsOjh1p9tuw0y73VNzOsCsFRpffKhJlhF6UOnxx+A5H++Mzn5oSp
	 0+eOuR9M66Qpyt3MV/60/TaxOgLtaAKxFjAZp/10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30629F80234;
	Mon,  2 Dec 2019 18:48:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 474ABF80216; Mon,  2 Dec 2019 18:48:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF10FF800B4
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 18:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF10FF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="j0V/rYCy"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="j0V/rYCy"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id B62A94E2010;
 Mon,  2 Dec 2019 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575308922; bh=CpVCZDDbV8uONbAOWgK1IYDM4Mmn8FjXn3PCDH2bR4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=j0V/rYCy0j9OOJs9b0zzjvCfxNIrV4m4PevJsbWiW6riW7EUmUPZpJtI8WiQnBxug
 7kPJUz8JhPc8EBwIxxeT6PwsJDj1AJExVp1droQt7kaEKhG+1C/7VLZljv558EJncH
 JJTKUrFHh9KmkQAhoQPZeUI2mpYu4MVCdfD0v15Y=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etR8VgNhfgfP; Mon,  2 Dec 2019 17:48:42 +0000 (UTC)
Received: from thinkpad-tablet.cg.shawcable.net
 (S0106905851b613e9.cg.shawcable.net [70.77.244.40])
 by node.akkea.ca (Postfix) with ESMTPSA id 933D74E2003;
 Mon,  2 Dec 2019 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575308922; bh=CpVCZDDbV8uONbAOWgK1IYDM4Mmn8FjXn3PCDH2bR4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=j0V/rYCy0j9OOJs9b0zzjvCfxNIrV4m4PevJsbWiW6riW7EUmUPZpJtI8WiQnBxug
 7kPJUz8JhPc8EBwIxxeT6PwsJDj1AJExVp1droQt7kaEKhG+1C/7VLZljv558EJncH
 JJTKUrFHh9KmkQAhoQPZeUI2mpYu4MVCdfD0v15Y=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: kernel@puri.sm
Date: Mon,  2 Dec 2019 10:48:31 -0700
Message-Id: <20191202174831.13638-3-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202174831.13638-1-angus@akkea.ca>
References: <20191202174831.13638-1-angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH 2/2] ASoC: gtm601: add the broadmobi interface
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

The Broadmobi BM818 uses a different sample rate and channels from the
option modem.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 Documentation/devicetree/bindings/sound/gtm601.txt | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/gtm601.txt b/Documentation/devicetree/bindings/sound/gtm601.txt
index 5efc8c068de0..efa32a486c4a 100644
--- a/Documentation/devicetree/bindings/sound/gtm601.txt
+++ b/Documentation/devicetree/bindings/sound/gtm601.txt
@@ -1,10 +1,16 @@
 GTM601 UMTS modem audio interface CODEC
 
-This device has no configuration interface. Sample rate is fixed - 8kHz.
+This device has no configuration interface. The sample rate and channels are
+based on the compatible string
+	"option,gtm601" = 8kHz mono
+	"broadmobi,bm818" = 48KHz stereo
 
 Required properties:
 
-  - compatible : "option,gtm601"
+  - compatible : one of
+	"option,gtm601"
+	"broadmobi,bm818"
+
 
 Example:
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
