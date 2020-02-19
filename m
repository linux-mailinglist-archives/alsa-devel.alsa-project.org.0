Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 287301644E7
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 14:02:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0DC81692;
	Wed, 19 Feb 2020 14:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0DC81692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582117351;
	bh=UToYEvW6lml54g3FIbEDBUXifAlDYtN97iTzZBlJYZo=;
	h=Subject:To:From:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t147OyQqCcu1WvPBqw/RCj0ppW8dqV/KKs3x50t1mX/W0K0fWcGTzyxRS8avq7etn
	 FjK3QHd6QtBqfZWa9GS89jilLmNYbmdTZdHfcFFDSFLI93frzbjZ+oc+Zsrizyw1YW
	 VuP7SBvk6AERN9wGwQ4URN6y7XTXGHx/mpa7Le3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C09F9F801F5;
	Wed, 19 Feb 2020 14:00:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4200F80273; Wed, 19 Feb 2020 14:00:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7AFDF801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 14:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7AFDF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="mpqlsKv9"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200219130044euoutp0119ed4ad4459e0b03d2b6516267164872~0z0BB9tOq3268732687euoutp01e
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 13:00:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200219130044euoutp0119ed4ad4459e0b03d2b6516267164872~0z0BB9tOq3268732687euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582117244;
 bh=ii8GQDIT+uQSHgPUzhTyWc8rNgTYbW4x5aLUgk7/fdk=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=mpqlsKv9L2hFCBeqs+sCPoLBI2pCd00S9vXrKh5QBmUSOcDVvQQtflhXrx8MSJ0xD
 +GycHv/CXw7WWmbchiNoZRIqfjkeBZxbz3VMocJsFy0OiPqy0MnhhlJ8DyWVHUm9S5
 K+f9bk3HYywa+XtL41Y9duhbJTyf/zaGtYGwShig=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200219130043eucas1p201ec5696edbd3b35c87867735de506cf~0z0A8LZz71243712437eucas1p2Y;
 Wed, 19 Feb 2020 13:00:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 67.DB.61286.B713D4E5; Wed, 19
 Feb 2020 13:00:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200219130043eucas1p223130679005b25ad2b22081c35731766~0z0AqUwEH0842708427eucas1p2c;
 Wed, 19 Feb 2020 13:00:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200219130043eusmtrp293d0e52664e55345fda81e9f27745b54~0z0AprYQX1308813088eusmtrp2n;
 Wed, 19 Feb 2020 13:00:43 +0000 (GMT)
X-AuditID: cbfec7f2-ef1ff7000001ef66-0d-5e4d317b9345
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id DA.75.07950.B713D4E5; Wed, 19
 Feb 2020 13:00:43 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200219130043eusmtip2e69d72b93110e15589430ae8323303ed~0z0AP2D2Q2992429924eusmtip2E;
 Wed, 19 Feb 2020 13:00:43 +0000 (GMT)
Subject: Re: [PATCH] ASoC: fix card registration regression.
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <96d80637-3c3b-6a72-85d2-4ee37c371804@samsung.com>
Date: Wed, 19 Feb 2020 14:00:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219102526.692126-1-jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHKsWRmVeSWpSXmKPExsWy7djPc7rVhr5xBhfmmllcuXiIyWLqwyds
 FvOPnGO1ePPoCLPFtysdTBaXd81hs5h4ewO7A7vHhs9NbB7vb7Sye+ycdZfdY9OqTjaPzUvq
 PT5vkgtgi+KySUnNySxLLdK3S+DKOPv6PlPBTLGKrSe+sTQw/hTsYuTkkBAwkVg66RxbFyMX
 h5DACkaJGZOnsIIkhAS+MErMXRkKkfjMKHH111+mLkYOsI5J+4sg4ssZJXrXfmaHcN4ySiw4
 uJkRpFtYwEZiz/dP7CC2iECBxLMJT8HizALTGCUOvBcHsdkEDCW63naxgdi8AnYSfZN3soDY
 LAKqEn375oLViwrESsxeeZgFokZQ4uTMJ2A2p4C1xIbzH5ghZspLbH87B8oWl7j1ZD4TyEES
 AvvYJU7tgCiSEHCROHbwOSOELSzx6vgWdghbRuL/TpiGZkaJh+fWskM4PYwSl5tmQHVYS9w5
 94sN5H9mAU2J9bv0IcKOErPXLGKDBAufxI23ghBH8ElM2jadGSLMK9HRJgRRrSYx6/g6uLUH
 L1xinsCoNAvJa7OQvDMLyTuzEPYuYGRZxSieWlqcm55abJiXWq5XnJhbXJqXrpecn7uJEZiK
 Tv87/mkH49dLSYcYBTgYlXh4P6j7xgmxJpYVV+YeYpTgYFYS4fUW94oT4k1JrKxKLcqPLyrN
 SS0+xCjNwaIkzmu86GWskEB6YklqdmpqQWoRTJaJg1OqgbHJp/hwFqux2wvrr3/2cC00bXt1
 e9NP/5Nxcy57zjGb/nP73Muvmu/fjawSze712ae94qtDxzaT396WQUUfLOO6pdmWuMpvOJLb
 XP3mW+z+ds8nIu8ur96yrzT8i+crsePcjmKHn/2uSd6pvfXw+V7zV99nLr6vkHtDY0bUapfL
 dTcX2oWcDU9VYinOSDTUYi4qTgQAJqG+kUEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7rVhr5xBo8PKltcuXiIyWLqwyds
 FvOPnGO1ePPoCLPFtysdTBaXd81hs5h4ewO7A7vHhs9NbB7vb7Sye+ycdZfdY9OqTjaPzUvq
 PT5vkgtgi9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3
 S9DLOPv6PlPBTLGKrSe+sTQw/hTsYuTgkBAwkZi0v6iLkYtDSGApo8Tp/StZuxg5geIyEien
 NUDZwhJ/rnWxQRS9ZpRo/93PBpIQFrCR2PP9EzuILSJQIDH94H9mkCJmgWmMEl2rp7JAdPQx
 Shx+2MIMUsUmYCjR9bYLrJtXwE6ib/JOFhCbRUBVom/fXEYQW1QgVuLGzA4miBpBiZMzn4DV
 cApYS2w4/wFsDrOAmcS8zQ+hbHmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELSsoCRZRWj
 SGppcW56brGRXnFibnFpXrpecn7uJkZg/G079nPLDsaud8GHGAU4GJV4eGeo+sYJsSaWFVfm
 HmKU4GBWEuH1FveKE+JNSaysSi3Kjy8qzUktPsRoCvTcRGYp0eR8YGrIK4k3NDU0t7A0NDc2
 NzazUBLn7RA4GCMkkJ5YkpqdmlqQWgTTx8TBKdXAuOjLOaewpgeT522x6N320FCietltxzmH
 zxyZ7iP+9vw0u96/f+69Ni8PfmZe822Hz7Z6o9dqi9IvGvquUjF4vFiM+2CRVVEty7HMXh2G
 4lsz38X8NEsr+jYz5sXPI0WyORaaKyw5U/rfWrgLL2+avLSyYP/UsHPO0z0mn7736PBh9b2m
 CxlS1ymxFGckGmoxFxUnAgCIHPuc1QIAAA==
X-CMS-MailID: 20200219130043eucas1p223130679005b25ad2b22081c35731766
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200219102548eucas1p1c4c4ec50d6d4e01500028bedfed5305e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200219102548eucas1p1c4c4ec50d6d4e01500028bedfed5305e
References: <CGME20200219102548eucas1p1c4c4ec50d6d4e01500028bedfed5305e@eucas1p1.samsung.com>
 <20200219102526.692126-1-jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
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

Hi Jerome,

On 19.02.2020 11:25, Jerome Brunet wrote:
> This reverts commit b2354e4009a773c00054b964d937e1b81cb92078.
>
> This change might have been desirable to ensure the uniqueness of
> the component name. It would have helped to better support linux
> devices which register multiple components, something is which more
> common than initially thought.
>
> However, some card driver are directly using dev_name() to fill the
> component names of the dai_link which is a problem if want to change
> the way ASoC generates the component names.
>
> Until we figure out the appropriate way to deal with this, revert the
> change and keep the names as they were. There might be a couple of warning
> related to debugfs (which were already present before the change) but it
> is still better than breaking working audio cards.
>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

As expected, this fixes vc4-drm driver registration on RPi3.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   sound/soc/soc-core.c | 29 +----------------------------
>   1 file changed, 1 insertion(+), 28 deletions(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 30c17fde14ca..518b652cf872 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2442,33 +2442,6 @@ static int snd_soc_register_dais(struct snd_soc_component *component,
>   	return ret;
>   }
>   
> -static char *snd_soc_component_unique_name(struct device *dev,
> -					   struct snd_soc_component *component)
> -{
> -	struct snd_soc_component *pos;
> -	int count = 0;
> -	char *name, *unique;
> -
> -	name = fmt_single_name(dev, &component->id);
> -	if (!name)
> -		return name;
> -
> -	/* Count the number of components registred by the device */
> -	for_each_component(pos) {
> -		if (dev == pos->dev)
> -			count++;
> -	}
> -
> -	/* Keep naming as it is for the 1st component */
> -	if (!count)
> -		return name;
> -
> -	unique = devm_kasprintf(dev, GFP_KERNEL, "%s-%d", name, count);
> -	devm_kfree(dev, name);
> -
> -	return unique;
> -}
> -
>   static int snd_soc_component_initialize(struct snd_soc_component *component,
>   	const struct snd_soc_component_driver *driver, struct device *dev)
>   {
> @@ -2477,7 +2450,7 @@ static int snd_soc_component_initialize(struct snd_soc_component *component,
>   	INIT_LIST_HEAD(&component->card_list);
>   	mutex_init(&component->io_mutex);
>   
> -	component->name = snd_soc_component_unique_name(dev, component);
> +	component->name = fmt_single_name(dev, &component->id);
>   	if (!component->name) {
>   		dev_err(dev, "ASoC: Failed to allocate name\n");
>   		return -ENOMEM;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

