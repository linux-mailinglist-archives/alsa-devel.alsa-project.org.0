Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBD13827E
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 17:43:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45DF616BE;
	Sat, 11 Jan 2020 17:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45DF616BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578761008;
	bh=4yJ2ENV+sZ48N3KVDeNqaj4O7AITLwupvDVbAN3E/EA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dHhDYE7uV+pSXIxzVzaosTEWFJYL9RF4cp/6Pe42j+thguaTQZwXj0pHLlaAkuA/D
	 BNGjHn7Oo5nJO9OaFvru5vqJPXW+PPmNr4V6qeXCGmHENc+YCkaas9ZT/ewD5lhCzf
	 ZnJ01/636lTt36OmoFk+07sM+vIYx9TQFfv2j0UY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F9BF80258;
	Sat, 11 Jan 2020 17:41:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 543AFF80246; Sat, 11 Jan 2020 17:40:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29F18F8010B
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 17:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29F18F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="JzjZxD0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578760848;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=J11ZOZUz6BhFHvlMHB3HBI6ztasM4eWyqSyYB7QVvhw=;
 b=JzjZxD0dPk/GFoNxUGdlr+DfC80j085PcthiCeiMYszXgw7ZroZKZT26hdaUW8ysVb
 l1LUz7xAIl/Q2Jt9EsW8huU/NldKDcdaStKpqNqzkigUhyCFexdD32fkzuKQWJJeuxm5
 Kv3T8zd8hwoPUjiBuUK937EgIdyqRnd/FfwwiGqJWNWOyTGJ30pYt3FP08aUpXiJfCrn
 2kIB/mFIFIQUHtKneeR9nL+Q6qgQ8xi20FBo7r5xlQ/VyCByIY6nQgOqLt7K4H6yLpAo
 sU4N1YnqKTBuSEWmkx38H7IiaYPWsT1qq6T/wMgb6ZypD7ORSSdECiR7YbL2Mf/jKhKd
 IfHw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXsMv5qxJRCe0="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0BGejFq5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 11 Jan 2020 17:40:45 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Date: Sat, 11 Jan 2020 17:40:02 +0100
Message-Id: <20200111164006.43074-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [alsa-devel] [PATCH 0/4] ASoC: msm8916-wcd-analog: MIC BIAS
	fixes/additions
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

This patch series fixes some bugs in the MIC BIAS implementation
in msm8916-wcd-analog. Finally, it adds support for MIC BIAS Internal3,
which is needed for msm8916-longcheer-l8150.

Stephan Gerhold (4):
  ASoC: msm8916-wcd-analog: Fix selected events for MIC BIAS External1
  ASoC: msm8916-wcd-analog: Fix MIC BIAS Internal1
  ASoC: msm8916-wcd-analog: Simplify MIC BIAS Internal
  ASoC: msm8916-wcd-analog: Add MIC BIAS Internal3

 sound/soc/codecs/msm8916-wcd-analog.c | 59 ++++++++++-----------------
 1 file changed, 21 insertions(+), 38 deletions(-)

-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
