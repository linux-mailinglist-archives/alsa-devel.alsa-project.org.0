Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1232B707
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 15:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFA017BC;
	Mon, 27 May 2019 15:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFA017BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558965227;
	bh=FOoCVuMzg4K5vkFF7ezmLzZNYsQ/SHeyY5K6E4pDDtg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ct8qrkHpunaTvjcBytkUgvEx7p6jxavWZx3LUY0qfnaxkta/rYOyVBGH4cPOMhlF/
	 UyuR5iSan6M8UPacblfWUmENBLUKAyU8kWqJC9UwHkUITgjkyWRLKgVhqM5BL+DUwX
	 I6rHAw+mMteGN3TzS0S12jtPqRLY1SS0KaSM39vM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F91F8973D;
	Mon, 27 May 2019 15:48:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 198DBF896E5; Mon, 27 May 2019 15:48:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_13, PRX_BODY_78, SPF_HELO_NONE, SPF_PASS,
 T_DKIMWL_WL_HIGH, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1801DF8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 15:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1801DF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LFu9LiSh"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDmBow053952;
 Mon, 27 May 2019 08:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1558964891;
 bh=tXdIuQWjAhHLfchDCp84KHyZg8p1JChPL/Ztp9I9tiA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=LFu9LiSht6nSP8iT+FEf/C0tJVePpm8+Kz/8V3ApTVfhrbQ8Tz2vFJpi57Rum8IBT
 nOaRxDmDUG/vTSbTHqT883j5ZCkFUX5JNifROWf3YlSMRS867hvGEumvvu0v7qZOjF
 XSb25qYGuMAA0mle7nMAKqJUJsxT98nqSOEmvfB0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDmBnm026368
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:11 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviI065947;
 Mon, 27 May 2019 08:48:09 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 27 May 2019 16:47:56 +0300
Message-ID: <f790277fabc45f987f90075dd842368705226a84.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: peter.ujfalusi@ti.com, a.hajda@samsung.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, robh@kernel.org
Subject: [alsa-devel] [PATCH v8 5/6] dt-bindings: display: sii902x: Add HDMI
	audio bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The sii902x chip family supports also HDMI audio. Add binding for
describing the necessary i2s and mclk wiring for it.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/bridge/sii902x.txt       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
index c4c1855ca654..2df44b7d3821 100644
--- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
@@ -9,6 +9,40 @@ Optional properties:
 	  about hotplug events.
 	- reset-gpios: OF device-tree gpio specification for RST_N pin.
 
+	HDMI audio properties:
+	- #sound-dai-cells: <0> or <1>. <0> if only i2s or spdif pin
+	   is wired, <1> if the both are wired. HDMI audio is
+	   configured only if this property is found.
+	- sil,i2s-data-lanes: Array of up to 4 integers with values of 0-3
+	   Each integer indicates which i2s pin is connected to which
+	   audio fifo. The first integer selects i2s audio pin for the
+	   first audio fifo#0 (HDMI channels 1&2), second for fifo#1
+	   (HDMI channels 3&4), and so on. There is 4 fifos and 4 i2s
+	   pins (SD0 - SD3). Any i2s pin can be connected to any fifo,
+	   but there can be no gaps. E.g. an i2s pin must be mapped to
+	   fifo#0 and fifo#1 before mapping a channel to fifo#2. Default
+	   value is <0>, describing SD0 pin beiging routed to hdmi audio
+	   fifo #0.
+	- clocks: phandle and clock specifier for each clock listed in
+           the clock-names property
+	- clock-names: "mclk"
+	   Describes SII902x MCLK input. MCLK is used to produce
+	   HDMI audio CTS values. This property is required if
+	   "#sound-dai-cells"-property is present. This property follows
+	   Documentation/devicetree/bindings/clock/clock-bindings.txt
+	   consumer binding.
+
+	If HDMI audio is configured the sii902x device becomes an I2S
+	and/or spdif audio codec component (e.g a digital audio sink),
+	that can be used in configuring a full audio devices with
+	simple-card or audio-graph-card binding. See their binding
+	documents on how to describe the way the sii902x device is
+	connected to the rest of the audio system:
+	Documentation/devicetree/bindings/sound/simple-card.txt
+	Documentation/devicetree/bindings/sound/audio-graph-card.txt
+	Note: In case of the audio-graph-card binding the used port
+	index should be 3.
+
 Optional subnodes:
 	- video input: this subnode can contain a video input port node
 	  to connect the bridge to a display controller output (See this
@@ -21,6 +55,12 @@ Example:
 		compatible = "sil,sii9022";
 		reg = <0x39>;
 		reset-gpios = <&pioA 1 0>;
+
+		#sound-dai-cells = <0>;
+		sil,i2s-data-lanes = < 0 1 2 >;
+		clocks = <&mclk>;
+		clock-names = "mclk";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
