Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7C481412
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 15:25:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9741817;
	Wed, 29 Dec 2021 15:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9741817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640787920;
	bh=Ei+lXkPbIaHpS0txYCFNixqmQqcdQQaWmqFXnMYH2oM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpjyPfEBhOgEuvDwi5opM2sFK+x3g8uMqE/89VUS0+TO5RYawNMrujNTraleck4Fe
	 Env6h36GllxS7FmwLMcgmmrWIzgNlKEUkMnHF9AFbBatkZSlrw/6O/FUd2PFjdtDmo
	 fgi6qW+4QXlPUjBuZc6pMYKwrYWP4dAlJh6jcTLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E09B2F8053A;
	Wed, 29 Dec 2021 15:20:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE235F800D1; Tue, 28 Dec 2021 19:11:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu
 [31.186.226.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A70B8F800D1
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 19:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70B8F800D1
ARC-Seal: i=1; a=rsa-sha256; t=1640715068; cv=none; d=zohomail.eu; s=zohoarc; 
 b=Wt4GPHKEWTIIBDsTgNxtbBUanAmIzXlQAGfi67OhlnkxyM8ynFgb5G8lZ0HueEDgS6a4AO6Sms/y6KQ7sp/ctATMR0Ashng04Fte1gmd6DTZti+q4eOFJkSd0eweR6i7IJyZIs66YqqfKXDJpE9YYejmrbpHO2jiRyjgUHyznOo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1640715068;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=/fwc56FAKMG1LNYNd43a5rhbPAtQvSgiuBH2beg1ceg=; 
 b=IZI7NDm96uvJ5rxdpdXuN3SFghnG7I68C4EH3OahWfsj27uH0+r2rsawHpGrVRhATvTORyTdxwxyWu7WImOquG/RhKJkD7c+VPcKAGbsldCmOudM6N2p+oOgWSGO1FSVy2AX+4HUbWCatzG3Ua2QE3qTB0ILTDVSuqsQt1GRkTc=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=philipp@uvos.xyz;
 dmarc=pass header.from=<philipp@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-113.unity-media.net
 [37.201.192.113]) by mx.zoho.eu
 with SMTPS id 1640715065616408.4636139419308;
 Tue, 28 Dec 2021 19:11:05 +0100 (CET)
Date: Tue, 28 Dec 2021 19:11:04 +0100
From: Carl Philipp Klemm <philipp@uvos.xyz>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 2/3] ARM: dts: motorola-mapphone: add interrupt for
 headphone detection
Message-Id: <20211228191104.631d126f13ac0bb09e91ca13@uvos.xyz>
In-Reply-To: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
References: <20211228190931.df5d518220080a734532ebfd@uvos.xyz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 29 Dec 2021 15:20:41 +0100
Cc: tony@atomide.com, merlijn@wizzup.org, linux-omap@vger.kernel.org,
 sre@kernel.org, kuninori.morimoto.gx@renesas.com
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

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
index 0aff0d306d06..e164169bf820 100644
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -72,6 +72,9 @@ cpcap_audio: audio-codec {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			interrupts-extended = <&cpcap 9 0>;
+			interrupt-names = "hpplugged";
+
 			port@0 {
 				reg = <0>;
 				cpcap_audio_codec0: endpoint {
-- 
2.34.1
