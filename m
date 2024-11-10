Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0F9C31AC
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Nov 2024 11:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36475E66;
	Sun, 10 Nov 2024 11:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36475E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731235543;
	bh=RBkaVa+v3bdfSur4TMosKjf3T1UqOD8FCPd0qxXj+5E=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KI3RRiZXXk4WCZlSDBvHmNf2mUUO9eCtSv4G2aZv0y8V+YEqnmsdVn56iPq0Qwbep
	 M80GOdnrI5VHIQa7RzZBVuw/mtmyAYuLwA84E+VezLC8jHSaskTK5dQu32MR2vazHx
	 uyTiGatuMSkFXETFO5JeuEZgs52Az4vYWd9oG68w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96A48F805B5; Sun, 10 Nov 2024 11:45:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BED1F80587;
	Sun, 10 Nov 2024 11:45:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BB4EF80199; Sun, 10 Nov 2024 11:45:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCFA3F800AA
	for <alsa-devel@alsa-project.org>; Sun, 10 Nov 2024 11:45:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCFA3F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=npCXaA+9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1731235492; x=1731840292; i=markus.elfring@web.de;
	bh=RBkaVa+v3bdfSur4TMosKjf3T1UqOD8FCPd0qxXj+5E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=npCXaA+9LbaI7T4MUptHXIE9s/sTgjf3EYTUtUB+Z+fPf+8Vrohx9Uq7Qj04mhbp
	 vXAEOLtqNplPRibmcXOhHGw4UNiD8YzLJLPq1PrU6IC/LM0PpwwaQ7xTvkoEwYgY9
	 iv/hk/LP2/SBDjcUacZwMDU2RhRI84eGcNPr2PazTD1A1VlosUCq/Ri/8sxp6ZGEA
	 kNoZ7SvZC/1UVyNxLrzmLwwLmWtqL6rI1dVROPSLmg+wE0S2iUO+d9DLv26LJ2cSh
	 PunNhNo8bTt9G58fY/93IZsRjRPiHBl5aDViBvEs1KrEmSoZXwJTgHa4SLc0hLS8g
	 4QjBYf8v89CWZiNHDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N3Xnl-1tssBb2LND-00tFjA; Sun, 10
 Nov 2024 11:44:52 +0100
Message-ID: <6ed94ce6-211e-4f6a-9479-34467e6ca7d2@web.de>
Date: Sun, 10 Nov 2024 11:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tang Bin <tangbin@cmss.chinamobile.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shenghao Ding <shenghao-ding@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20241025082042.2872-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: tas2781: Fix redundant logical jump
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241025082042.2872-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kq2cIavDfgtbPbNSQLm6JLpH3awd+E/fzjLmAO/20DY0oIkYfk4
 U6iqWBnEmLcu7h0s8lk/RD3Y0DDBdzQICiPLvt1/NfBWurjZiQxw6+vWhjXKL3kIy6FbtER
 0Mqn3I2Cz7Aa2GXWLqLt6L2qov+ZDPZLYINjjet5yQWpK+xF4NY74POlVQyxdJfi9wVAOTg
 UluwJ61bqcVojDU99xtLA==
UI-OutboundReport: notjunk:1;M01:P0:1/WxcWUAL50=;NI6XhN6vHl5Cy63vKB5kyxF2Kcm
 vtmiiTN+CsU0/YgbrcgPKKS59yKWfV7NJw7GrR5y+8sTCMy7m4mWL60VS7sI2O7sfc7guZvHy
 Rz3Mni7eMtFJlwS1618bk+WYNvQsYmVJhVSzxKh7sTXlI+yukCAdqamnrEZvAMzDHl4btoD3E
 /108XPlr6Da/oIu5RRp8359wAkqk4VSfmLiP7Fsam5StD4C+SfA8tNAM5oXto5u0csQ38tPQt
 wSuuPCkawIOF6Z2gojWbGYdJ2ErtUL2nyNi2i/yQA2L++FjPoMJvAW9KnxOfGv4okkHRURxsU
 QmKloITV5GCO0ELLLP0OM41f4Xaysm1ZGXRRDoEs8cXIGYb3DdY2isCCWNYn75r7ihIWbmDyZ
 M6rPSf16AjJnssgZlFaTHb/AlobB81WrabFm8OI8uhyYEu48KIpk7OpEk5meVxf4HFGFFOL5+
 SyZ5WgPGBEBu2IcnS9ShPh9jeFGimX+pYhpO2rTIP6Mz49ZF9cbOhPinYwGyWgYlbYC6Vv2+Z
 Q6nDCXkLOKdyhIBDk7VFbry+WH7qe4dpLZe0LOYmDtRz71rrcXuZ8skJYAfn2DToxX5uqrXey
 iNcRX0z51Q9mBtHaRCU3U+xpeNKrOFPF/r9y6yV8dZe7q2Y9Q6O9Em0ep9otwmysTq0FtVXHZ
 w+OZihCMsjB9W+mdr9p3nHtQIG6wqHS4wuA5dQt4P3PydSlrTVmfZluDS7W6Ds3yCXltjkWj7
 MN3NM8kSALPNheGu5S9BIkGnT/n+1PF+nlopqfUhzXffFvZ2d9c3CzTllrNTWQM42X0cQy0/V
 uVppwj1bR7dR1ErWq5O/ODpLBtNF8M0zgyjSbL53voWD+21+1An0t9F/q7r9JkdqZoSSGlnOo
 xerYhEwPndfmdThlEBjYymJIKlTZp9wGSGPgZ1G6TaTWMANTuAwwCDwfz
Message-ID-Hash: F5KWZRAQ3SDX5O3DN6KOWOBIITVZE3NC
X-Message-ID-Hash: F5KWZRAQ3SDX5O3DN6KOWOBIITVZE3NC
X-MailFrom: Markus.Elfring@web.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5KWZRAQ3SDX5O3DN6KOWOBIITVZE3NC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> In these functions, some logical jump of "goto" and variable
> are redundant, thus remove them.

Another wording suggestion:
Return some values directly in a few function implementations.
Thus remove local variables which became redundant with this refactoring.

Regards,
Markus
