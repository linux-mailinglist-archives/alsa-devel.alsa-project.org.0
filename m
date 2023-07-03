Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61B74636D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 21:39:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A6B1E0;
	Mon,  3 Jul 2023 21:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A6B1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688413181;
	bh=QKXpbyUUH/cjeu+2HCURMlRGCrW4lylUi7rD1j/KZ/o=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i1LVnib+B3Hwhsd0p0z5/KUiOntDt4UmUIi7IMSkTLIFMnO8SCJGpCaDUG4BtK7gE
	 u78Byk5Ar8XfofnE3QnA9xnnOHvRLELJJtVc+iqs4mBMhnruHr0uyzcWzFnRdyljgU
	 GuAbi06WU1uAduwXFfz4ojNt2bKBDp6U7FGt4rlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7866F80544; Mon,  3 Jul 2023 21:38:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 841FEF80104;
	Mon,  3 Jul 2023 21:38:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C69DDF80125; Mon,  3 Jul 2023 21:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0409CF80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 21:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0409CF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=UE32JHZy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688413115; x=1689017915; i=markus.elfring@web.de;
 bh=QKXpbyUUH/cjeu+2HCURMlRGCrW4lylUi7rD1j/KZ/o=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=UE32JHZyiR/tIfilOkEIQ9nBzhAtPUStpwWmiUIdqHzTqM22XxI0PdBfevmLUbioRmdmKjl
 692mDJ4gR15MUCRerAlM9qge6DmsTxWFOk74MoBsR+fFAxXtBgnOJsQufhDYtLMWcGsw2e+2h
 8g8cq7886Sw2CxXMFiP7pl3q1mcED1lHUbSiomKMIGUZxhquluejgPZqh6PYlkt+8SInT5tW2
 KNOcbLcdX4rw8tcmln624FhjxJdjN2tihQ3WEhanJ34Tpk4l+tl+aFHdJ1mEwq5ol3pMUveUC
 lav8sDiFN1t6UoyTHSuBild48/y3fLzLd8uBoMQISSr+Pb2ybxcw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M76XT-1qNJGH3rtH-008hQC; Mon, 03
 Jul 2023 21:38:34 +0200
Message-ID: <2d38ce57-5385-50e2-3ad4-7030d2b09719@web.de>
Date: Mon, 3 Jul 2023 21:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Johan Hovold <johan+linaro@kernel.org>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230703124701.11734-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd938x: fix missing mbhc init error
 handling
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230703124701.11734-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pbhh/XP8/ROmGCqqirPmMCe/VSwTyRuO9yi7a4YrbsVOIRWZmEv
 SKgiN73fETtZwUMD9Ke3m+o9uwbBIgs9eeF6QdEvxt12LRYMlQOIt0RJ8mB4Iy8UJ+eFFFi
 UoBKD36KIBddfQOiZKGJBWREYRwnNjrxG6mh9SVgRj1Jr+XI/G5eDCof+TDQ+g3S9ti7pLe
 60r4/JABhfDNt0TpbNFsg==
UI-OutboundReport: notjunk:1;M01:P0:WgWNs8oH8WM=;Ydp+Afm3vTpA465b2gOy9l0FBB8
 fR7dAoUmR3ae++cl+YPDMPIavAV96GlH/1u1jqzYnXHD3KXZEe+q6uhRRnRP6S6GW/E2kbUom
 2EPzhKC0jJzTurHYOIQhFT1/TrJ8mHv0rVAGDdw7O4y/dsbyWpGNE2Vi7c51q3eS4ol+9oZXC
 h1HqO4S8tF5WHXYsb/bM6wTyd5GRKq+c+UH6pIFEbYlDshTp+qhkoBWQw3JB0ooZnCxG7NDeU
 3plXpm566ubQiC61yAPyDcPH3xKY1sy0gt9PnbOIP99M/iDvJ6/l+fTOQCQWCekr3rmLHdfcx
 X29bDfqk3eFr0FN5uoRlD0bSJbn2xxs1ig6XmOup6Lv1NLy7x92+KE7VJiIus83V+WFE+XqQH
 NO8jEsiCAZXOjSfTwZzvmEZpL/RDsuh+KECk8F7E1HY3UVLzPqVtms/PV7MpqTsZxiWZtkDAa
 ddzbPo+c08rR0edsLZQ5uz5gQHHLpaaG9fJQXDbL7yk/HFI6Jq0iqOdq9tMYfAizrdgZtQVix
 Jxjv9IEpzva+KyBlhgrkxE3immM6t+prjerhF7Diw1gbWjeFxzdhbk7vDoBCD60RF9R2EucT1
 mFbJo6DoFNdGLzwZcH6lhY6GNAidBCv2E9GwrV9/dnhNLHhGw+n7vPagIALMrAw5kQPyNsdSJ
 K1tg/lKRAgyJlljCpugjY/SII/l0svVn+Gsq6Uk/VpJ29zt/EfNwhFDbmlKFkdNa0Eu86U3K4
 8IbsQV5mkUfUlFMla3AOkaEWJWs2iGJ+SyT9I0fMUfmUSYHx/hPK/1SjOQgnt0ZscCOVl9kQA
 I0t21cVSUT2KBsDOzQULZSn+fTeRKc6O4a3QbgADEva/+R00iTru0+yvrXjPfcZI6VdRCXG/Z
 aJpcQzg89IZ9XcxLrjjiQt4H31Vk0YOv0YeH6pTfmMdT4+eHZIOXx1KMhmLFJBuBMw2jiLmfN
 2JbJdg==
Message-ID-Hash: 5PWETEBAXX3S5Z2J35C5JZXJYO5EQO4P
X-Message-ID-Hash: 5PWETEBAXX3S5Z2J35C5JZXJYO5EQO4P
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PWETEBAXX3S5Z2J35C5JZXJYO5EQO4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> MBHC initialisation can fail so add the missing error handling to avoid
> dereferencing an error pointer when later configuring the jack:

I would prefer a different wording approach for a desirable change here.
How do you think about a variant like the following?


MBHC initialisation can fail.
Such a data processing situation can be indicated by background informatio=
n
as follows.

    Unable to handle kernel paging request at virtual address ffffffffffff=
fff8

    pc : wcd_mbhc_start+0x28/0x380 [snd_soc_wcd_mbhc]
=E2=80=A6
    Call trace:
=E2=80=A6

Thus add the missing error handling to avoid dereferencing an error pointe=
r
when configuring the jack later.
=E2=80=A6


Regards,
Markus
