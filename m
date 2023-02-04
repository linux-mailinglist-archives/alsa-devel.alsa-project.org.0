Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBC968BE6A
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:38:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289DD82C;
	Mon,  6 Feb 2023 14:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289DD82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690691;
	bh=eMnLIAnCsBu62ngMXd0e+Iuq0D5lfhe1fWYdXIDE93A=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=brnvHAEd7yVyMMkkCTXS/ONMSqyoGBsQtssRK7QjRQYrcZbo2ogzuADDY778VpBVZ
	 oMvLsb1FzzRWMOM0mYcm60az5noRtpEqTJPN2KexYvrQ3ss7uVAJpdb6uvqr5ZECYB
	 AM7fhTOlj7oJWwCu9o0orN78IIeh3V/4xLcFmGqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0015F8056F;
	Mon,  6 Feb 2023 14:35:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B99FF804C2; Sat,  4 Feb 2023 13:06:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F060F80162
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 13:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F060F80162
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Vvh4wwML
Received: by mail-ed1-x530.google.com with SMTP id u21so7470787edv.3
 for <alsa-devel@alsa-project.org>; Sat, 04 Feb 2023 04:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:user-agent:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ksVDjHxV+cyF7jv7Jb/qzIdMe9R6S1nKnyvD+CP/UYU=;
 b=Vvh4wwMLH2HABN7GoxslW8PlzOl62k5+lELKOJog8JMgAXhYPzxu6+kASH9JdyJXMM
 lIs0cpL/fY0nbwHsXzrmong2WsB9F3eN2hDflOYhKJAl/nSJfqpCrETkFWCj6GLWS8T1
 +5k/xr0QkEHiG1QViX6chE145b9mxjvT8YXqU7MC3W28Mq42Lc0GvU3vAIVwONVvenkm
 ec56eqVVD5WhFK63aZJXOGjj7eO2cR3to6SMPhkdVeKd1wp7xgdFbR1EDYsCpFfJZK2e
 vjZRzFWCypzoJPTOkcs1v5PO6nbezppNBSY6eddbgPdmyxFwEuaSkRTa0jYOMuH4LIJs
 pNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ksVDjHxV+cyF7jv7Jb/qzIdMe9R6S1nKnyvD+CP/UYU=;
 b=020po9RLkqo2pGgE9eI/li7gc1yNMIvqEg6cd4iIEnlIyQky9IVVhCNGDsfyV7VEtI
 hShJTzYhi2q+Znvo27ulll0N+pMJBovwyQHq+QhhnACvoc/0H1cUt5448VaMZlLLJZCe
 /cIfVEYW8Eqx7p3olIXerIDh6cXUuKPzIPeL2y83kb8Efzs5oVC8J2CQZh437QMeHvua
 Z9TWCdkxQjmOkpf9rHaxcnQZmEC5S9/Z0lYrsVt6Oe6Mg4Y/2PpYaDEx0unUXl/vFM0p
 FMCXhP7tJNrPmmHfdY7eNfESmp/NYt1L/7M27qhAP8j1B1DMup0ocVQCrUyYKbJoIpvn
 jZQQ==
X-Gm-Message-State: AO0yUKWyoyltDLWaMx/g5gXADB7zVzYGu3ts/f6vS/l21yPECqDrC09X
 EfnriBcZHd8LOZncexZBNKzhabaNWco12Q==
X-Google-Smtp-Source: AK7set+S2vh3m9zz7vhVTqDszivLNt962JWEdW4jca9DmZUGkqVw+7FQXG2jdeDgSE/uHR5haIBvxQ==
X-Received: by 2002:a05:6402:371a:b0:49b:98be:c38 with SMTP id
 ek26-20020a056402371a00b0049b98be0c38mr14527825edb.11.1675512357465; 
 Sat, 04 Feb 2023 04:05:57 -0800 (PST)
Received: from smurf (80.71.142.58.ipv4.parknet.dk. [80.71.142.58])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a170906534900b0088478517830sm2724332ejo.83.2023.02.04.04.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 04:05:57 -0800 (PST)
Date: Sat, 4 Feb 2023 13:05:44 +0100 (CET)
From: Jesper Juhl <jesperjuhl76@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Make ALC4080 front panel audio work on ASUS ROG STRIX X670E-E GAMING
 WIFI
Message-ID: <9523a3d3-230f-a142-6316-ce2369f78b4c@gmail.com>
User-Agent: Alpine 2.26 (LNX 649 2022-06-02)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:04 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi

In order to have working front panel audio for my computer based on a
ASUS ROG STRIX X670E-E GAMING WIFI motherboard with ALC4080 audio, I
need to apply the following patch.
It would be great if it could be applied up-stream so I (and other
users with the same hardware) don't have to do this manually in the
future.

Kind regards,
Jesper Juhl

--- /tmp/USB-Audio.conf.original	2023-02-04 12:50:27.691689435 +0100
+++ /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf	2023-02-04 12:53:43.307961781 +0100
@@ -40,6 +40,7 @@
  		# 0b05:1996 ASUS on multiple boards (including ASUS ROG Maximus XIII)
  		# 0b05:1a16 ASUS ROG Strix B660-F Gaming WiFi
  		# 0b05:1a20 ASUS ROG STRIX Z690-I Gaming Wifi
+		# 0b05:1a52 ASUS ROG STRIX X670E-E GAMING WIFI
  		# 0b05:1a27 ALC4082 on ASUS ROG Maximus Z690 Hero
  		# 0db0:005a MSI MPG Z690 CARBON WIFI
  		# 0db0:151f MSI X570S EDGE MAX WIFI
@@ -50,7 +51,7 @@
  		# 0db0:a47c MSI MEG X570S Ace Max
  		# 0db0:b202 MSI MAG Z690 Tomahawk Wifi
  		# 0db0:d6e7 MSI MPG X670E Carbon Wifi
-		Regex "USB((0414:a00e)|(0b05:(1996|1a(16|2[07])))|(0db0:(005a|151f|1feb|419c|82c7|a073|a47c|b202|d6e7)))"
+		Regex "USB((0414:a00e)|(0b05:(1996|1a(52|16|2[07])))|(0db0:(005a|151f|1feb|419c|82c7|a073|a47c|b202|d6e7)))"
  	}
  	True.Define.ProfileName "Realtek/ALC4080"
  }

