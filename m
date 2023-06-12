Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 705C872C44F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 14:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBF4C827;
	Mon, 12 Jun 2023 14:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBF4C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686573195;
	bh=fUaq8Y0mGLErZLulbaIWMnDdGZvkdA5k3OjbbgrK2l8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PzraujX/qzkRKH+3wBdbbSTracYSMgcivz2Knhe19OleRwVc1Xwmb0YktTHs7e2Ux
	 TTatHHKWRhpN+CiMr4+gqDunzvvo/ERsrZxualZconJ9MdWq1fG/zTP35FOv292gjq
	 bU/auttwSUzRKyNpciMHsHTt7ALC0BE16SQpQGeI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 363A7F805C5; Mon, 12 Jun 2023 14:30:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4728DF805C8;
	Mon, 12 Jun 2023 14:30:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE2AF805BA; Mon, 12 Jun 2023 14:30:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 098EBF8057C
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 14:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 098EBF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nCIqawbr
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686573019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIE4XthfYfgue+TiYRLnyKQDQmR/Am6iv4V0HmdFU7o=;
	b=nCIqawbr3Jd3MdBKhO2gX/ob47ElwOr7TI6dbXyK/DcIqoU7HsgSHZzUKMSFnJHM/4qBkg
	IzVnZt0fd0fvqYaHgR1uXgsQ49uqEtkNNPDxxP6yME6SXql31tM9D1cjd4QNaPllFjkRmb
	h6My7GYGPDrAMsHjXSAatlELkuCLMY0IiRj3R2YL0a0CbxsXiBKvXXMti3iXkZUmx2uEZY
	bLLyzNORLmerE2AIPt0GMncgvimSEnpwI3iamDAgqs8ev2DOC08a9ZtSpCaLvVbv+P8Ytx
	jHYvenA8pAMfOne62J7SeBLyMctSd/sDlj+TR+DLzhB553Fj3TSX0duwEZEV6Q==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id CD272240021;
	Mon, 12 Jun 2023 12:30:16 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 08/12] iio: inkern: Replace a FIXME comment by a TODO one
Date: Mon, 12 Jun 2023 14:29:22 +0200
Message-Id: <20230612122926.107333-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612122926.107333-1-herve.codina@bootlin.com>
References: <20230612122926.107333-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MDGEZ7HAGKOKM2S5UAU3R3PO3LN6NGK6
X-Message-ID-Hash: MDGEZ7HAGKOKM2S5UAU3R3PO3LN6NGK6
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDGEZ7HAGKOKM2S5UAU3R3PO3LN6NGK6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This FIXME comment is more a TODO one.
It is a note when someone will need for this currently unsupported case.

Change from FIXME to TODO.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/iio/inkern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index ae1a41d3a559..4331e74191cf 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -879,7 +879,7 @@ static int iio_channel_read_max(struct iio_channel *chan,
 			*val = max_array(vals, length);
 			break;
 		default:
-			/* FIXME: learn about max for other iio values */
+			/* TODO: learn about max for other iio values */
 			return -EINVAL;
 		}
 		return 0;
-- 
2.40.1

