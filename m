Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F731BF2BD
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 10:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFD89168E;
	Thu, 30 Apr 2020 10:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFD89168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588235210;
	bh=+/6KpuAI5OnaH1+1INwZBtm3jDTuiqntf9j7SGav3go=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjBqJ3UB+loCbFYcje/onykx0myEOX4wk8lhhicnWdAEbx6Ah6HaJwtchUa9tVx+t
	 muRRMRu9aIT+h25lIgLle1YoLmRHbFR+PjiEzLTPzOkeR06FoYauV+uTNwSv6iC+G0
	 MMhdDziCN7cDP4YKq6iefq83wgHyzusNVJSKFefU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0910DF802A9;
	Thu, 30 Apr 2020 10:23:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AC4CF802A0; Thu, 30 Apr 2020 10:22:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8AF5F80299
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 10:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8AF5F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="uJ9oa9vq"
Received: by mail-yb1-xb4a.google.com with SMTP id i13so6783948ybl.13
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=QAhamvk4O2Zfa+EjtB3QZix8CErM5lewhJjCrqGiG5U=;
 b=uJ9oa9vq1OeIFOfRXkMQzsWiPrjME2C//jSl5p+G95D9I3FqA+0s/BJRZPwQ8VyClm
 9rvLixnHU3Ed+Iq3mvcFA9nB+n/rSm0LPNr4PQJw5UVXD0mGQDKXuthzBMQwgpnw5oHE
 1cKVwYtZ/h1z9dZZ5HD3OQJPO8NRj9LH5Y4yodBCLuS0v1DYvZu6a9iQ0wLd8Vc2wJkA
 vjBmwppc8sTrIgi4S+Nu/zgRyNcy6jeTbiZIqo35eMUnTKmQYs2cxJr8mpKXQlOqHy+p
 X+ksrAG1Xh4ooNAwsbQHd2KkRvk+yynB6X16dnNriTNgt/3TFp9m61hGNSzHFjZwwdpE
 atFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QAhamvk4O2Zfa+EjtB3QZix8CErM5lewhJjCrqGiG5U=;
 b=Ptv3LdO0vVI7C5Nhs7N08lepL46xSRsVxhWPOjhV//13FgrELcmLctU88NVjTZVPnf
 Qkted2xcAP07C7eAJ93xctfrgJ5IqVPrcAKZrONOHg2+gXyEgvNTJ4uzvG0bEpfEc6St
 MrrEVfT4AAXWIgakITXisnAoE4NmQedzkK5GH8Qk7y6Va6w0foqd6fLiEZ11Er54GdIN
 dNkGEhTdREhmZpj4bTcTZF43ycn2GJr7kXm7QpfkUzjj7akZIepZr73fTMDXUam9HrSi
 LTcbBQzrGnzN2ye0Xnj2i/+NdmyO8Qw31DyglbYW/mLYFKvjYh6xd4eYqKZ089rM0TnA
 fn7w==
X-Gm-Message-State: AGi0PuacK6nbQ9eoysjcS9MjzQrmOXQX0tEcpjZGmjY9c6s2YeA6Ydrk
 /rPK3ggSnyMFbmPxfY4ioL4WvwtBeXo5
X-Google-Smtp-Source: APiQypIQo7EcrMYmhrDQCSdNkKaR4g+3RNIhpbhobADhH4JEuN8CHqCIhP3spY4twrMnzqP/VZnh+Q1G6o5B
X-Received: by 2002:a25:ced3:: with SMTP id x202mr4048625ybe.164.1588234970687; 
 Thu, 30 Apr 2020 01:22:50 -0700 (PDT)
Date: Thu, 30 Apr 2020 16:22:28 +0800
In-Reply-To: <20200430082231.151127-1-tzungbi@google.com>
Message-Id: <20200430082231.151127-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20200430082231.151127-1-tzungbi@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 3/6] ASoC: rt5682: remove empty default case
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Removes empty default case.  Also adds a missing break statement.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt5682.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7a38028f5e10..d38b2e8a7f43 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -950,6 +950,7 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 			break;
 		default:
 			rt5682->jack_type = SND_JACK_HEADPHONE;
+			break;
 		}
 	} else {
 		rt5682_enable_push_button_irq(component, false);
@@ -1526,9 +1527,6 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component,
 			RT5682_DAC_ADC_DIG_VOL1, 0x00c0, 0x0000);
 		break;
-
-	default:
-		return 0;
 	}
 
 	return 0;
@@ -1550,9 +1548,6 @@ static int set_dmic_power(struct snd_soc_dapm_widget *w,
 		/*Add delay to avoid pop noise*/
 		msleep(delay);
 		break;
-
-	default:
-		return 0;
 	}
 
 	return 0;
@@ -1576,9 +1571,6 @@ static int rt5682_set_verf(struct snd_soc_dapm_widget *w,
 			snd_soc_component_update_bits(component,
 				RT5682_PWR_ANLG_1, RT5682_PWR_FV2, 0);
 			break;
-
-		default:
-			break;
 		}
 		break;
 
@@ -1596,14 +1588,8 @@ static int rt5682_set_verf(struct snd_soc_dapm_widget *w,
 				RT5682_PWR_ANLG_1, RT5682_PWR_FV2,
 				RT5682_PWR_FV2);
 			break;
-
-		default:
-			break;
 		}
 		break;
-
-	default:
-		return 0;
 	}
 
 	return 0;
@@ -2483,8 +2469,7 @@ static int rt5682_set_bias_level(struct snd_soc_component *component,
 		regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
 			RT5682_PWR_BG, 0);
 		break;
-
-	default:
+	case SND_SOC_BIAS_ON:
 		break;
 	}
 
-- 
2.26.2.303.gf8c07b1a785-goog

