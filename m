Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C06BB503
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 14:45:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D02E1289;
	Wed, 15 Mar 2023 14:44:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D02E1289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678887941;
	bh=AvcDXc4jlGkgyjQp8T3e9zdVvLRdYlwTs2oz5xGiwcQ=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=RjyLPUlr1kYuZeUUDM2xUoPXY9zWKj0I7ieUinu/lPjAwCuFG197po3TQ+Ujjj3DB
	 bZi5aNeN5UzanlX7NDDryDG0fqaeeb/9LAopI9+wNHoKQ0XC/gOu4FkB1miUULF/sC
	 iounilToy372M3crJLKBxF1vaffo1ZIDI1yJSfQM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B4E5F80567;
	Wed, 15 Mar 2023 14:43:14 +0100 (CET)
To: Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/7] Documentation: sysfs: Document the Lantiq PEF2256 sysfs
 entry
Date: Wed, 15 Mar 2023 14:42:27 +0100
In-Reply-To: <20230315134231.233193-1-herve.codina@bootlin.com>
References: <20230315134231.233193-1-herve.codina@bootlin.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7L3SSS3CCHSZC7KOOMY7FFOFJVUNFL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167888779364.26.9200222608363841485@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 503A3F8052E; Wed, 15 Mar 2023 14:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02DF7F8032D
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 14:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02DF7F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Z5VllREu
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 7CE0240016;
	Wed, 15 Mar 2023 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678887762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ErIeGZOdBC0SggTn7/aNvCYajOT8ftQ+YUi6Mg1r8hk=;
	b=Z5VllREub8q03kyXMToln2CZgjEQsHhknoySCVz3SVeEJlubW9XbLJgNKsShbjLXTygxUz
	gLMo5OgIh8LdLY5f/ybH7ELQ+tJRPU+JEmegMOpgqKYy+PnrR5Yk46HZ531k0BUug+QsaN
	B68pZdiG/sh0KyYxn3bobQe6yvFFaQqoPBj+Q9uzDCiPbpDqveXrwv1iLLwkXeDU7Ofxuq
	BMsO0KQVgzyYOGbnwwUnmta60ycSNFLAPp1qqFd2/kR0EvFc4cC1oEht8U0O46azIAsgbn
	y8ty+tCryuEVuhSZMnXAnraiE1YVKnfimGW3/lvWfBBotXFCB4mBl58npwoPrw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 3/7] Documentation: sysfs: Document the Lantiq PEF2256 sysfs
 entry
Date: Wed, 15 Mar 2023 14:42:27 +0100
Message-Id: <20230315134231.233193-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315134231.233193-1-herve.codina@bootlin.com>
References: <20230315134231.233193-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y7L3SSS3CCHSZC7KOOMY7FFOFJVUNFL6
X-Message-ID-Hash: Y7L3SSS3CCHSZC7KOOMY7FFOFJVUNFL6
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7L3SSS3CCHSZC7KOOMY7FFOFJVUNFL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document the "subordinate" sysfs attribute exposed by the pef2256
driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../ABI/testing/sysfs-bus-platform-devices-pef2256     | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256 b/Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256
new file mode 100644
index 000000000000..b2343b3b6e84
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256
@@ -0,0 +1,10 @@
+What:		/sys/bus/platform/devices/*.pef2256/subordinate
+KernelVersion:	6.4
+Contact:	Herve Codina <herve.codina@bootlin.com>
+Description:
+		(RW) Controls whether the PEF2256 works as subordinate or main
+		device mode.
+		  - 0 : main device mode
+		  - 1 : subordinate mode
+		In subordinate device mode it synchronizes on line interface
+		clock signals. Otherwise, it synchronizes on internal clocks.
-- 
2.39.2

