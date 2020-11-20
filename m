Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012F32BB293
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 19:25:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0FE172D;
	Fri, 20 Nov 2020 19:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0FE172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605896726;
	bh=+9m9Tix3zo1E+IN4qSy2H96Ab04qH4lP0hi/QiPNlOo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnxWkkzkklk77KRBaR1YY/aIeRx6RoNRgkVUAp6orQukLHQoxv9hJTKyXWtg1AzT6
	 eWzsWqrFSdVZhWXyaT4HuiuUqkK2OVvrN8cRaGMqFdQzwDy4QkNt6rpAFB+rAGXjL4
	 lKc4NYukNXEKygHGYxtm39eXT8XxBdfDv5yX73BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCB5F800F3;
	Fri, 20 Nov 2020 19:23:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53C04F8016C; Fri, 20 Nov 2020 19:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBB60F800F3
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 19:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBB60F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q6tSotYJ"
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 613082224C;
 Fri, 20 Nov 2020 18:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605896626;
 bh=+9m9Tix3zo1E+IN4qSy2H96Ab04qH4lP0hi/QiPNlOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q6tSotYJpZgWbzq48qaqRAORcfUfVn9vocPCYTAYOmX1DE+C4k6SRT6eFYLkaMZIF
 Y8f4oTl7w7n7lOl9ddWkJq6fXrohIbqNp3kfTNnxtg8Ps8tcbFOR5/w/im1qWTj5oU
 zSWCOsHliwzBpmzYJlEWabsFX1jV3WDCLKf4AmBo=
Date: Fri, 20 Nov 2020 12:23:50 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 002/141] ASoC: codecs: Fix fall-through warnings for Clang
Message-ID: <d17b4d8300dbb6aff0d055b06b487c96ca264757.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
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

In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
warnings by explicitly adding multiple break statements instead of just
letting the code fall through, and also add fallthrough pseudo-keywords
in places where the code is intended to fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 sound/soc/codecs/adav80x.c | 1 +
 sound/soc/codecs/arizona.c | 1 +
 sound/soc/codecs/cs42l52.c | 1 +
 sound/soc/codecs/cs42l56.c | 1 +
 sound/soc/codecs/cs47l92.c | 1 +
 sound/soc/codecs/wm8962.c  | 1 +
 6 files changed, 6 insertions(+)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index 4fd99280d7db..75a649108106 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -373,6 +373,7 @@ static int adav80x_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	case SND_SOC_DAIFMT_CBM_CFM:
 		capture |= ADAV80X_CAPTURE_MODE_MASTER;
 		playback |= ADAV80X_PLAYBACK_MODE_MASTER;
+		break;
 	case SND_SOC_DAIFMT_CBS_CFS:
 		break;
 	default:
diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 1228f2de0297..e32871b3f68a 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1034,6 +1034,7 @@ int arizona_out_ev(struct snd_soc_dapm_widget *w,
 				priv->out_down_delay++;
 				break;
 			}
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index f772628f233e..796b894c390f 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -944,6 +944,7 @@ static int cs42l52_beep_event(struct input_dev *dev, unsigned int type,
 	case SND_BELL:
 		if (hz)
 			hz = 261;
+		break;
 	case SND_TONE:
 		break;
 	default:
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 97024a6ac96d..bb9599cc832b 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1008,6 +1008,7 @@ static int cs42l56_beep_event(struct input_dev *dev, unsigned int type,
 	case SND_BELL:
 		if (hz)
 			hz = 261;
+		break;
 	case SND_TONE:
 		break;
 	default:
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 6e34106c268f..52dc29942ec2 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -201,6 +201,7 @@ static int cs47l92_outclk_ev(struct snd_soc_dapm_widget *w,
 		default:
 			break;
 		}
+		break;
 	default:
 		break;
 	}
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 0bd3bbc2aacf..3af456010b9c 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3203,6 +3203,7 @@ static int wm8962_beep_event(struct input_dev *dev, unsigned int type,
 	case SND_BELL:
 		if (hz)
 			hz = 1000;
+		fallthrough;
 	case SND_TONE:
 		break;
 	default:
-- 
2.27.0

