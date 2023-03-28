Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83D6CBAB1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 11:29:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD4084D;
	Tue, 28 Mar 2023 11:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD4084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679995754;
	bh=IcmwxX6vt19HLHZIxSYPJns+gseGew1yQFiPCed5btE=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=fI9/Q/vxuB6ACo+xJ3w6gHzXq70yTKEf7G2o4RgZ9qZLLT6XPWYRUzV/kT1Sla8K4
	 M/J38qb8Q4EMjFDc4tSeXgYdip59MFNBXmutOSuPhC/NpjgSROgNvxviiw5t3msX4z
	 aCS9FON3jem1IZtiqSa4kAJcfaU0OVu6Q8Xiy/6I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BAA8EF80495;
	Tue, 28 Mar 2023 11:28:23 +0200 (CEST)
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 5/5] MAINTAINERS: Add the Lantiq PEF2256 driver entry
Date: Tue, 28 Mar 2023 11:26:45 +0200
In-Reply-To: <20230328092645.634375-1-herve.codina@bootlin.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7MZEP5FXNFK2B7P3LGH2LPZBARFA3FB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167999570301.26.13918694363396825984@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41296F80552; Tue, 28 Mar 2023 11:28:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7B53F80533
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 11:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7B53F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iqIkJ85n
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 0DF9A1BF20F;
	Tue, 28 Mar 2023 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679995620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZF5AfOr6NqUrKibPpIKyfVUE8v0dg0CjG97i8h7gyg=;
	b=iqIkJ85nmrquXK9GjThpibaxr08Y4csHtpKqnr3ywQ1soYxs94hbEorxeDY1LGPI81RPrZ
	l3kaHeygZfEuLjZ1oaZGE+11DlZsw5tbCXKfzXhZdRTL6IAoXNQzxJWxkm8iB0RANZwOkE
	EM5w7StJ0zmk5uTfx41jjWqSGneu1CRpv12UPchrWbOdPZEhH9YCyUqCR0k5T6HaP+yZXH
	i/McCFK54as/LhbFmJ41e4Ha+sVnDav+jyqIjut90Z9xOmauEtaTofAhyRBnds2KFXKkzV
	yGm0ikHoHnttkZjpuSoQNDwdljIfo45XJ75VPb6usIxPgRldUmjMrFJVgrNLBQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 5/5] MAINTAINERS: Add the Lantiq PEF2256 driver entry
Date: Tue, 28 Mar 2023 11:26:45 +0200
Message-Id: <20230328092645.634375-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230328092645.634375-1-herve.codina@bootlin.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z7MZEP5FXNFK2B7P3LGH2LPZBARFA3FB
X-Message-ID-Hash: Z7MZEP5FXNFK2B7P3LGH2LPZBARFA3FB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z7MZEP5FXNFK2B7P3LGH2LPZBARFA3FB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After contributing the driver, add myself as the maintainer for the
Lantiq PEF2256 driver.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcb69242cd19..a17c85648f6f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11651,6 +11651,15 @@ S:	Maintained
 F:	arch/mips/lantiq
 F:	drivers/soc/lantiq
 
+LANTIQ PEF2256 DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256
+F:	Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
+F:	drivers/mfd/pef2256.c
+F:	include/linux/mfd/pef2256.h
+F:	sound/soc/codecs/pef2256-codec.c
+
 LASI 53c700 driver for PARISC
 M:	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
 L:	linux-scsi@vger.kernel.org
-- 
2.39.2

