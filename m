Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3692E1A0992
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 10:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8CF386E;
	Tue,  7 Apr 2020 10:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8CF386E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586249595;
	bh=4Ud6l67/V9wg6wPLRDKH+s0O5muhTEE0cRfge6//ga4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EImQfILHS4Vxnx5wmcl70F8XOi+5nf95+i3Q81eEXocDLFLkMVloZQOKrDFln+5D6
	 cLpMU559dVU1fg3ZDGOiWgE+qBcDa7CYntpVS0z9KCDlUxlgKhvHdxFWOdbFvCBk31
	 FKz0XmJay0JVi/52gOAWhJF9GdcLPelWKc+NLL1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E075AF801F9;
	Tue,  7 Apr 2020 10:51:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D30CF80150; Mon,  6 Apr 2020 15:56:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74512F80121
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 15:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74512F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="QZrQdIpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586181410;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=IITu+NanlcIJX52gLPjRou+laNLOAcxtxp7r92paWjg=;
 b=QZrQdIpDPQW8HQgBS6ytyk/gZrkuehCWiVw6VWLJFEGEjOgjRZpsuL+obZ4sX0zyif
 n30fDckVaoQW1kL5C7I16j6nnUiwcf/lEVCj1+EuhS1qv3BBxCnc4AzuhXY+R4Igeqww
 AIc3T+MjjbC3OlN7dsX4MIhqpo/Gaa0D3F367LqukhUrP2kyHj4CVc3DgzA6tOzyMhqn
 0oJbBdswz1xcTJLHhYe2OoVOQhX7mkF2cGH2VKbqCZFziGxb1maL4CYP66Rswa9N8Nx3
 L5HV/xg7ZZgeFq1RzVlDyRV7eVv+DS3XytzsCTm/E6GkmTP7J8DuSsDVnibL7wUWaPh1
 7ybw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NBgYo"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id u043b8w36Dug2OM
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 6 Apr 2020 15:56:42 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] dt-bindings: sound: lpass-cpu: Document DAI subnodes
Date: Mon,  6 Apr 2020 15:56:07 +0200
Message-Id: <20200406135608.126171-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Apr 2020 10:51:32 +0200
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, Patrick Lai <plai@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Kenneth Westfield <kwestfie@codeaurora.org>
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

The lpass-cpu driver now allows configuring the MI2S SD lines
by defining subnodes for one of the DAIs.

Document this in the device tree bindings.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/sound/qcom,lpass-cpu.txt         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
index 21c648328be9..df53a10502f7 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
@@ -30,6 +30,8 @@ Required properties:
 - reg			: Must contain an address for each entry in reg-names.
 - reg-names		: A list which must include the following entries:
 				* "lpass-lpaif"
+- #address-cells	: Must be 1
+- #size-cells		: Must be 0
 
 
 
@@ -37,6 +39,18 @@ Optional properties:
 
 - qcom,adsp		: Phandle for the audio DSP node
 
+By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
+The SD lines to use can be configured by adding subnodes for each of the DAIs.
+
+Required properties for each DAI (represented by a subnode):
+- reg			: Must be one of the DAI IDs
+			  (usually part of dt-bindings header)
+- qcom,playback-sd-lines: List of serial data lines (0-3) to use for playback
+- qcom,capture-sd-lines	: List of serial data lines (0-3) to use for capture
+
+Note that adding a subnode changes the default to "no lines configured",
+so both playback and capture lines should be configured when a subnode is added.
+
 Example:
 
 lpass@28100000 {
@@ -51,4 +65,13 @@ lpass@28100000 {
 	reg = <0x28100000 0x10000>;
 	reg-names = "lpass-lpaif";
 	qcom,adsp = <&adsp>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* Optional to set different MI2S SD lines */
+	mi2s-quaternary@3 {
+		reg = <MI2S_QUATERNARY>;
+		qcom,playback-sd-lines = <0 1>;
+	};
 };
-- 
2.26.0

