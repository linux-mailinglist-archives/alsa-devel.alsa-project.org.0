Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4DF8FFC1C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 08:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C58AA845;
	Fri,  7 Jun 2024 08:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C58AA845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717741097;
	bh=E44XiueJpOmG0UDbwDwwFtCzJsFzM/AcIjGJQz3r3/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UCNiXfINMTOFQroJMmoMWi4hGVU8dM+HdF3PnmMOgzWUHy3eUVH2e14fDiRWRjVnL
	 GavAKJSq5+UkblR02OLsP+YQs6U2Gb6tK+8EbYa3xuiK68cWqePJDOfrz1o7ZKPg5i
	 /ZlTyUJ4PXyHeU8YZyp9J3C89vckTKEzTlk/PZtw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D97E8F805AF; Fri,  7 Jun 2024 08:17:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A75CF8059F;
	Fri,  7 Jun 2024 08:17:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28FF6F804B2; Fri,  7 Jun 2024 08:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D78B3F800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 08:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D78B3F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=norik.com header.i=@norik.com header.a=rsa-sha256
 header.s=default header.b=E/5+aOH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I/oNhRwc6Wd73jsIJiFBr4U+0PGZF33BeCX5Kedx5c4=; b=E/5+aOH2+kNveqdTwTjoIMEvx1
	NxWxTnmElm11/qpvW6SlCtvr1f+qCybQLJmaxf6ewL73kGWZgRDnhgwiM2+gcILj2FF8I5HaevMC8
	D4Nxr2V32VDYRkoU4CDznL7iRSaenyfteuaZnFV1nqgH1qlPUFJZVeBTjkSRT9jJbPo+1he2xnQIP
	ADvYtifYeltAB3qjzBeiIHCoWCSVGuwUpK/DOfHpLcvhIUj2xXnQXpaIplkoHTyjYDI9emwP5Jkyj
	GKK4r0KjQ1PuohrrtrEjM9giqFkXcAZO39XD2zq8/eaziiXWFX8v77IscotJn0qyfbvBRKdYBbJPh
	c3ZlM9qQ==;
Received: from [89.212.21.243] (port=57710 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1sFSs5-00FHTK-2x;
	Fri, 07 Jun 2024 08:14:41 +0200
Message-ID: <fe0ec57b-dad3-4666-abe3-75bcb65fa7df@norik.com>
Date: Fri, 7 Jun 2024 08:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
To: Mark Brown <broonie@kernel.org>, =?UTF-8?Q?P=C3=A9ter_Ujfalusi?=
 <peter.ujfalusi@gmail.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-omap@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
 <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
 <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
From: Primoz Fiser <primoz.fiser@norik.com>
Content-Language: en-US
Organization: Norik systems d.o.o.
In-Reply-To: <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Message-ID-Hash: 22UFNNRXXIEBIUCNZWDTWJTGKEEGBLGG
X-Message-ID-Hash: 22UFNNRXXIEBIUCNZWDTWJTGKEEGBLGG
X-MailFrom: primoz.fiser@norik.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/22UFNNRXXIEBIUCNZWDTWJTGKEEGBLGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 6. 06. 24 20:01, Mark Brown wrote:
> On Thu, Jun 06, 2024 at 09:00:47PM +0300, Péter Ujfalusi wrote:
>> On 6/6/24 10:06 AM, Primoz Fiser wrote:
> 
>>> -	card->name = devm_kasprintf(dev, GFP_KERNEL,
>>> -				    "HDMI %s", dev_name(ad->dssdev));
>>> -	if (!card->name)
>>> -		return -ENOMEM;
>>> -
>>> +	card->name = DRV_NAME;
> 
>> I think it would be better to name is simply "HDMI" instead
> 
> That does seem a bit more user friendly.

So card->name = "HDMI" for v2?

Thanks,
BR,
Primoz

-- 
Primoz Fiser                    | phone: +386-41-390-545
<tel:+386-41-390-545> |
---------------------------------------------------------|
Norik systems d.o.o.            | https://www.norik.com
<https://www.norik.com>  |
Your embedded software partner  | email: info@norik.com
<mailto:info@norik.com> |
Slovenia, EU                    | phone: +386-41-540-545
<tel:+386-41-540-545> |

