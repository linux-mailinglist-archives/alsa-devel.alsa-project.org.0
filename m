Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A47640182
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 09:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57AB017E2;
	Fri,  2 Dec 2022 09:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57AB017E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669968254;
	bh=R/T/9Ws+IBQK2XhryxrPcKdNkYPB7cW4DkKNDVzTfdg=;
	h=Subject:From:To:Date:References:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=I0TsiDzUMYlm0zR/qIh42faYcVpGn9VlIYkEvvv5Gxp/pCbhb2sDxHxbTTbt4AvPx
	 8Q+iCzL6KlAK0jOLHWveUMLDTxXY9s66khLsqByvZsUsMUowtQKSXtzSZxIXWmpgoK
	 BK/bnoGMtYx58uaKNbpH7915Fnb2HVkgF7EuDBQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6558F80162;
	Fri,  2 Dec 2022 09:03:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E5CAF80310; Fri,  2 Dec 2022 09:03:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,
 PRX_APP_IMAGE_GIF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B46DF80162
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 09:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B46DF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="kAPFMcLQ"
Received: from epcas3p1.samsung.com (unknown [182.195.41.19])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221202080302epoutp04defaacf0ac0c92896ece3fe9908140c0~s6zbCbix_1106311063epoutp04q
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 08:03:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221202080302epoutp04defaacf0ac0c92896ece3fe9908140c0~s6zbCbix_1106311063epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1669968182;
 bh=fO49ZGq/2EW7GT0URfa+PIVGBP0B8fDsjRndsZoPdDM=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=kAPFMcLQ+XQZ5XOL7SFwnaDdCn1SDC/kNkK22nkHUwo9IFmpwikmEF5v4NK/I1d+8
 nKccF9j/Ar6taj1y4NTsSlajOi1ejWAUeC9iPguf0a9bcthAL/uagC+9wEowQnP2AY
 0XJzcXnwDXus9vyXFQUoDstVn+88Kogb+AvQL01I=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas3p2.samsung.com (KnoxPortal) with ESMTP id
 20221202080301epcas3p2b53a1889ef50c5ca2e5493bf9400d1c4~s6zawn-dY3005030050epcas3p2W;
 Fri,  2 Dec 2022 08:03:01 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp3.localdomain
 (Postfix) with ESMTP id 4NNlmj6cjDz4x9Px; Fri,  2 Dec 2022 08:03:01 +0000
 (GMT)
Mime-Version: 1.0
Subject: [PATCH] ASoC: soc-compress: Reposition and add pcm_mutex
From: =?UTF-8?B?6rCV7Iug7ZiV?= <s47.kang@samsung.com>
To: "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 CPGS <cpgs@samsung.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: DesktopMessage
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <1983025922.01669968181916.JavaMail.epsvc@epcpadp4>
Date: Fri, 02 Dec 2022 17:00:32 +0900
X-CMS-MailID: 20221202080032epcms2p68f56a6b43d7d6a4f0d2de9295c0e4ab4
Content-Type: multipart/related;
 boundary="----=_Part_2032967_1590215667.1669968032428"
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20221202080032epcms2p68f56a6b43d7d6a4f0d2de9295c0e4ab4
References: <CGME20221202080032epcms2p68f56a6b43d7d6a4f0d2de9295c0e4ab4@epcms2p6>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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
Reply-To: s47.kang@samsung.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

------=_Part_2032967_1590215667.1669968032428
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"

   commit a385cc2614c17ba3002b263c0ca47dfbf6395c78 (HEAD -> fix_compr,
   master)
   Author: s47.kang <[1]s47.kang@samsung.com>
   Date:   Fri Dec 2 15:45:16 2022 +0900

       ASoC: soc-compress.c: Reposition and add pcm_mutex.

       If panic_on_warn is set and compress stream(DPCM) is started,
       then kernel panic will occurs because card->pcm_mutex isn't held
   appropriately in
       soc_compr_set_params_fe, soc_compr_open_fe and soc_compr_free_fe.
       So, I reposition and add pcm_mutex to resolve lockdep error.

       Signed-off-by: Shinhyung Kang <[2]s47.kang@samsung.com>

   diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
   index 870f13e1d389..7bce5088b455 100644
   --- a/sound/soc/soc-compress.c
   +++ b/sound/soc/soc-compress.c
   @@ -149,6 +149,8 @@ static int soc_compr_open_fe(struct
   snd_compr_stream *cstream)
           if (ret < 0)
                   goto be_err;

   +       mutex_lock_nested(&fe->card->pcm_mutex,
   fe->card->pcm_subclass);
   +
           /* calculate valid and active FE <-> BE dpcms */
           dpcm_process_paths(fe, stream, &list, 1);
           fe->dpcm[stream].runtime = fe_substream->runtime;
   @@ -184,7 +186,6 @@ static int soc_compr_open_fe(struct
   snd_compr_stream *cstream)
           fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
           fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;

   -       mutex_lock_nested(&fe->card->pcm_mutex,
   fe->card->pcm_subclass);
           snd_soc_runtime_activate(fe, stream);
           mutex_unlock(&fe->card->pcm_mutex);

   @@ -215,7 +216,6 @@ static int soc_compr_free_fe(struct
   snd_compr_stream *cstream)

           mutex_lock_nested(&fe->card->pcm_mutex,
   fe->card->pcm_subclass);
           snd_soc_runtime_deactivate(fe, stream);
   -       mutex_unlock(&fe->card->pcm_mutex);

           fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;

   @@ -234,6 +234,8 @@ static int soc_compr_free_fe(struct
   snd_compr_stream *cstream)

           dpcm_be_disconnect(fe, stream);

   +       mutex_unlock(&fe->card->pcm_mutex);
   +
           fe->dpcm[stream].runtime = NULL;

           snd_soc_link_compr_shutdown(cstream, 0);
   @@ -409,8 +411,9 @@ static int soc_compr_set_params_fe(struct
   snd_compr_stream *cstream,
           ret = snd_soc_link_compr_set_params(cstream);
           if (ret < 0)
                   goto out;
   -
   +       mutex_lock_nested(&fe->card->pcm_mutex,
   fe->card->pcm_subclass);
           dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_START);
   +       mutex_unlock(&fe->card->pcm_mutex);
           fe->dpcm[stream].state = SND_SOC_DPCM_STATE_PREPARE;

    out:


   [cid:cafe_image_0@s-core.co.kr]

   [update?userid=s47.kang&do=bWFpbElEPTIwMjIxMjAyMDgwMDMyZXBjbXMycDY4ZjU2
   YTZiNDNkN2Q2YTRmMGQyZGU5Mjk1YzBlNGFiNCZyZWNpcGllbnRBZGRyZXNzPWFsc2EtZGV
   2ZWxAYWxzYS1wcm9qZWN0Lm9yZw__]

References

   1. mailto:s47.kang@samsung.com
   2. mailto:s47.kang@samsung.com

------=_Part_2032967_1590215667.1669968032428
Content-Type: image/gif
Content-Transfer-Encoding: base64
Content-ID: <cafe_image_0@s-core.co.kr>

R0lGODlhCAKQAIQAAAAAAP///8k6OspMTNRiYtt0dOSOjumiovLExPfZ2fvt7f/+/uvr69TU1Lm5
uYyMjG9vb0dHRzMzMyoqKgICAv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C05F
VFNDQVBFMi4wAwEBAAAh+QQBAAAVACwAAAAACAKQAAAI/wAZCBxIsKDBgwgTKlzIsKHDhxAjSpxI
saLFixgzatzIsaPHjxkDiBxJsqTJkyhTqlzJsqXLlzBjypxJs6bNmzhz6tzJs6fPnzYFAh1KtKjR
o0iTKl3KtGnJBVCjSp1KtarVq1ZVCnXKtavXr2DDih1rE6vZs2iramVAtq3bt3Djyp07Mq3du1lT
bg3QwIFfvwwasJUpmK7WBikL41SMkjFLxyIDq+w7uCVkpJJZZo6MWKyDtpdpfl4qFQFWBQnwQk2g
gCpqtXorQ4gwgUKECA0ijI6p23DKBw9S9jYJgffuk8NbJh8JPPEE3I+DL0/anKWDCCSvj6XAtUFw
k9NLFv93yd3oeJFSB2BFUACtgakFTE9lDxvlXpHaRYZXftw3zvIv7TeSgMj1F0B1J+XHUnMEEoWg
SgoGEOFXADL14EsVrpQhUBXaRd9Z6p314VRrlaRgBBBQMAFiDERgW2UBtEgBBdKlOAFbMkbAgAPf
8Xhgbd+J1MBsNKaI3Y80xujiigGkmGSTMxbXAJDj2diZSM05GWSTDQzpYnFGIhmclxSM94BtE3z2
AJBYormbjEzmyFZvayYJ3AOj4TlSbWCqiNgDKY425QQPoOinki+SBMGZcbqY5KIqOlDbZ1OWKaSK
EWwpY5IM8Ildp2Vih+IEYiLKpJYiWZnqoYpGeWCd36X/mCJJwE3qYqxRtijkkUKyKWeTjHY5AaGb
BgdBl0SeByVuEEzQp6VQzgolkyNVqmOpP6bZZIoMwLpsXVG1Z8ABAxCQmgIEDGCAuKkl8N4B6b5n
wAAFuEuAAQakBi+9CowoVYnZ8XrbgWAWrKiU3NHGAAQGMzxlqg8wQIGwVzowcQM0dirYxSsWSvCU
O5JaqEArLtoidmt2SypzD4AsKUm6WbxxlxQ4IDHFMt98s8U2c4xzzcyh3HBxut08pXfAHTlx0N7d
uOaB10bm8MCAbmv1gChjxzBfCYvqNHbEZhpAmhJvuTXGwJ6c9sA1C+Szx4C6LLLTc6tMq44ap4z2
yNJi/+n0xdyNrDGTVe/pAMYLG0y1jg6fnbBfE99cbc0WsyV4x4wHTjfM0kXs881Po+g2xRjvlt4C
BbR3gLgHKJA66qbRN4BpAySQwOwIDKCA6wgoUDvqB/gbFcAjnfiZdktLTJJQFgcgtvJLo60tBd1W
GWR+5elW+KIeCyQpW52Bnyb1Eoo6GrWvgswXzH4d2Vvg1uen/Xhpbg8c/bt1z1b0j9sPnMQhC5jz
zoe0kjDoeNhJXoV6ox3mPe5V5XtYBFe2qOWxpXnk81gGE4gl6+nve+sbzopEeKUY8aV+33kg2lhW
PpGUR3wO2Jq2eoUfyaGNgSgLjgMHKL/jcEdBMOzNDf8JOKAxEQxihZOOmqwXgA5FRT3xWYDsWrM6
2EmxPb9LzQLU86EotmtcwoMK8fAjMAQ2cUYzIom1HtjENroQWA87ExqvpzT98AiNGaNNxKLFoiWN
j4zOw2P+jFWmEsbMfZ8JHB7xhMjqaG+RjnyTHvc3kv5BsnMVLJ757HihA7YQjws04xoHCMHrWAyN
ujnSg0ZZHuQBsjxynFHEJsnHQKLxOoIcCZxQ+MbhVKg52DNVmkBWoQgB6IHaac4oD2lHkvzwSLs0
ZS9z2SuxxZJGD6LTIt2InidaUXZQoU8U6QOvKG7xilCJ4rwIQIDgtYcqY2xhM10pJJLM8IHQw9EP
nVX/nOqUMJgD9GeMAtOsGHmHelsbIPm0M5wSKrNb5LNjD9so0B5GUqCR1CVBSUU+5WnvO38KDqCW
pklSjo1HW4IgDrlpSDPek5TATGVkdqTKLb20lRz8JJZAOtAhkSowZ2qRoExawoR+tJej+WVwgmnU
z/BTgBICYIyQmcOxpZCHiHSmPJvqS6KqsXzcq2d1lAjB9XEzAKcbJxbD2R61LoA1qzvAObuIgNVR
0Z31Ocl95ElKhi51ZS60XML6KSqRHmlYiAGh2ADpxpjdyHmA0iGNDivN0jFMbd1D350oO6D2NXOf
c2KkHR9WOsXiiVSlG0kFPWpYHj42U82RGGAB6bG9/6XUk36V0GxXmsEHxrSJfyrO0gjlTMFCtkmF
Ra4bTbvayYqkfp/CXIzQJ8SaVQd+B1KqPFUItECVhHoAtOYmkxmc3mK1mZWUZ3V51M/ARfdKZLuO
+jL1sJcx8LXlxQ9avenWAsh1XcBbwOoSQIDWjGuu74zPAd6DLrzCMzYmKmMLMeai4zTLWdSjTW0Q
Q2GSuki1w5otQHtzYdSiKWIhxo7FaJMpUM1murRR1v9SzL6JDmthIVbvZ0q84xw3KcS7oTBxO4wY
EufYkSlt4LCA1snJitI2QOtsCy/MLTotFWXPWdqahmW2YXFLyNgZ1HO4WWKuTZLGnYoxjJ2VHTTB
9v+qncoyra78xhU/Z6kb2jLCXFRkM54JUF7OsGdN+tw0HcnOLR7Wh9PMZuac+MfDStWkTFrmsd2I
O2mNXXsIzM725C514iJAAcy1AHbS1XejxlcYFxDPlhzOJF0yUWV2BKOS9AUmt47Mq/FzpVwfyHK8
2nWCSqgVm/HFQNmBka+japIdXYnWsDYQ+oY9GWIXz9qwxna0KxPrbC+vhJux9ZuELWwJ/dPay04Q
ro9TOFs/29iN4bC29QpvIfXn3taGtr2zg21f0zo4aHlNVGxXGvksoF+tmQrCzdJq/8xkTWdCtsNf
4qWJWxwoa5L4xXHSLf8IRDUgD7nIr8IyjZtk5Cj/T7lUFNA6lbs85BvPiV9iTnOdfBwvrLlLzl9u
l52X5uBaDLnPdZ5woSNg6EM3i8Cn4vOlzyfoKXc6wxNTa1xXfSwmhxBQKHV1Wyu76waVSdbDrhcO
g73sLbk5VN5zFnOmxe08b7vBvXkAuYq87iDHe8g/DXe4X+U9q3b7qg3QTpUD/p1oOYl3CC2TC+lE
TytZmIZosiGdBC6lBWJfSibUkspHGEKbfElxOK9XBpxO7nfxe9zzbveQ6x0vr1dN7MM196uEyCqq
p0ruQX57u5zEk2RpEGNT4nmWFP8mxy/JcghEepw0f/gweWbaTb92egm4XHYnF6kLsM7UjKtc5yoA
/7+s2P23ih9froNK+gcer3QSfuDrGoBc7YWvBBQg4flS3fzbf33ut4v/tyNqrfdW6bJ95HJ/b1Uu
/lUa7CRXrjN+32cunLZg+kIvBGAa+zJ/8Scv9OIuByd+8mdFqyEv2pcAJfiACIgvtRN/C2Z918cv
81IvDCZ+KViCwyMnkkIohtIoicIwL5IbO9YthERc0+JQdbJENVMp7bUiStgrSfIlRbgqfVNWOcRl
UlgeqjJSQVYbTJIptqEfZ1JHwGSFxeI8NjInaqIiW9JAjoInreUjA/IqVrgsNMUlfFEcLqY1yAKF
gfRiqmUbksKHjKIp1JeARyeBukNgJkgAqKM67/nxOlWELwsgiQp2f/AyiQbgOu1BagsmFe3UYFvU
O1GRO62jO7mzO/FxYAR2Tnj3if7lO/0yO6XWOgt4gbczgIVXRSFYi0cXglFxgacoiZSoOvdXf/Gh
iLlziL1jirXjO7aDO+LyHqsoeG1FjK7TOsL4iJmYO8/YOhJogLeDAPSRjY0oYIhnNZc1NUKDjkQD
AUJlMZ6TPjfyMiPzMo7WFyJzLcQSNig2S8ExTNSzJt6hI/SYOXP2RinTPHzjXgH0NPbUWmXSIuXl
jmJzeSdVOWdDKgqzNbpxNIhTUo7DUNyRSQg5jwyJIgxlRhxpPjkzMQupRpQTOdTjkRH/NVCn04mT
WHdsJ1f9pWlb1C5QxB52Zy66g06SeIHsx1bnxIBr52CVKGDvoR51hwCMeEU4CYxVyR6rmJMrd3C6
CBV1t5UHthpZ6YwJ+E36BztXWVdsB0YJRjvotDtSFJSj2FY+GUVZRJcfEiJe9IFyxUVYBJRoOTz8
o1JmpEAwlTQyBRwgVGTfoVn0U0D2mJKTiRuPZTO5NTZAyDUHSVFXVV3HpZkXgiMalFgJZJqeKUE2
s0OL1T9MBEg7xB22sZnpdV2ktCMp+UnAdl4D1BvKo1UW9Zo2SXcDUJzyF3s9iU63F5TmFB8hQh+K
2HsfAk6l8U5T+ZalZkVSGTzGSS96/xcfuWOc8WGdA6h9rxMi1wmWrecvyzmYeKdgdqdg3emUcAmd
6SJ+IohOydmebrWU6lQuhQeYS3lO/clqx2SYn4RHfYUiECdShHQstjQjg8RJdNZCMYNHMlVSjiKh
XcVCnolU03RLTfYcOUVPrsSYvHJCUGZSljRHJTVKaeIszaNVtpkcuWmiLIlIHZpeFrVNM3WTdqcv
2TeYblWUvgM75nSBRfkh98J24ZSVa1Wd6klXs1iU2/khu7OWWNov5Ml+qUGd6Slg6/lOy9gaR+pW
71lX8ammq4FO2olOSEmgBidOd0k7ZqqX78SXdYWAeCegRoqnhKlPCEpPIUQpgAiIEP8EVCM0VB56
VJXJm95zaHXYUCzamRbZRl1FqavEJDi6XByEojX0Ur7ZPzxVUi81G5lCG99VVirkWbwFSMzUm5/x
mzzaSKX6o95EYK3hX6tIlUR6l3JVRU95O5ioidVXe7+zgL03l6lhLlQKL2y3nT8JlbcTi7SjL1HZ
GoX3pOkUpX2qrQOoO864gMLqk2m6iuGoq8BDpX5KRXSplMlJrnbppnraiaAooPI6mGIkXoOaXPZ1
PhqZQUnzXDzyKTX5NLblQo5JSlomXKOTTAZbPdlFK6N3qdh1JlAzVUKYHSvDNsZSXh/7oeA1MeaF
IhnbkfhVUuYFcRajLB9KUf0EAbn/5TFi82Kxqj0GCZyINF9BonalVmCEx05rly6mkZzQSS/J2jvs
VHjooi5kuqxzyU6tsaxUyU6Hl06mcYtQIa0H+Dvah5RdW4EN6IlWy4joGawAWp5Wm4DilxpoypO9
E7RIKbduGkWmFmr3UjvU+Ktsm7T0irWo1qQ/e7Rtq6+sRmTZVShPVmEm9WEFBUFopmEyFmIO6jc3
9mN3xGfZgjAU6WVrViEU9mG2yWjc0SKeeyEhVlBo8lirS0nNoWeQliK5sWR9BmkipjWBRjOek1IW
C2MTox0rNjBilqPNJCsZMiwTVWm4qn6imABzJ4ppsXBPB5ZUZJ1OKhXOexVaWXt2/7FwJggVpHZw
0At0VTG+VSF1qxF00osW5pu9VrG+BBdy63sW61u/5vtg+sYX2Ja/LlFu5fYq/7tvxYMj9dZtx8Zr
2UFvK4FvEFIZ1LMbD5wYvUZsyJZuajRvLsG/ZMcZK6EnK6RL9aZG/eGzq4cV8EIuGBind7FqIIcu
61KVJRzDMjzDIBcWjldzq6pVOCwak+WyMUHCNDwVUxlO3IsW3+tyJthyQbzETNzEYTFzO4wStxXF
onHDMLEXmxFuIgxrYIdSQJHFGGwSfxHCO6HFOsEYfTHGZ8fBEPI/PIGbUFzGYdxsYwcuAwd1TfxW
RXcaeMzHVUFwRbx3Kzxyr5F0f/+8O318vomcFXuhIKS3YuAhcbexJj4cFP1kLHzVebehuTsxeim6
E8kxG7VxG3P8fD8CaGvcwbsRvJerF5VMHJncEgLZGFsyFfeSx28Ft2gxe+uBeFLRpy8HtVURPAMK
cnRKFdcLOyysfu8ygAzXyMH2yTsFEx4zXXXcvymafCgBIO2WE9psE9Nhyp9HfJ1BkjNhowKDeVA1
eee8WCbxINg7aricpqu3ary8xLu3wr48FcK8zG56FwNVUrQFK4MyS7LEJT51Hujzat5CJiMVZkSC
K0wCJPczm3joItfihVHzRrBaULAieUqiolKSLMsyJCINholSLVy4h9AShjMk0An/XYZ5iCgb3USD
URi/IiMxmyaSYilb1hkKwiAFpSpsoio6XdJSwicoXdNjoytO2DJzuF/qaQDyEYHOa3d1FRXfKabp
4oAg+F9fNIHcB34EqC7u104HYH+g9oHj17QANnAKyJNlfX8PSGoEZtbA451Sizo5SdYPeJzsZH/V
R2pWfb7xwi53XYwdSHj1V7Uh6IGTeNd1t39m7S7n9y/QXFJ6g1DH4jg8BF7pVRISczgrIjMYg2J9
kTEBuTkCCRylpTUG84Rbws3CtZoyeTRHxI8tSTOexY9N1Dn2pCa6cdtHwzPjXDmJw5kmMzBbk1Cp
Ql+qNTSdwiOPxY9Tskd8VZFq/8LaHbM5lwWQve2Pvx2a+FEcj3VSiOMwdlxqJsh2kFgvfNl6eieV
BUaskkisaqUAxuiIs3iNochyrSOOAEaO42Ksv7iMfxlg/lVFneiKf+mNj5jg742JBEhgpShgBXaJ
E47MtGiXC8iruCOu4Cl/yPiW8JLE/d1O3GiWYpTZA42QOnRBjzMheRY/deRaEENC5NVGyMNhsjnN
lXQbG+ZG9lNB9LUyppRVzyRBGgTk9dQtGTo/BHvc0CTjNp2xiEmxh4KYC1VAqhl6EmIbGsbROh56
K9LlPG6ZWJJTD1JBFaSaG2vHq4guWAunZarVdiet5ySXueOeuswevmqOS6l3iv84rUdalFVElk1J
oPMn6IgMpf6JgRLuk3xOl+9qLgWaHtWLpI2OYFgb6G756fq3lQtGpS1eGY5cVR+6TINWSbMW56Da
WIOWNIK049J3oLA0238R2tckWiaJShP1TPlBTw8iR7dhUd8Rzod2JKz0SgrabFsDSmcFTBhKaJLi
F1eSPaPBTBtaMxki7MtO5Db1HGwWIfAcTvRSuGg6Lr4832K6tXMNqPQM6GTqrUOZ5925lCPyIcBM
YAvoOp8YnsUZpVEEzG6V2JYuguPpk1TxnHbp73let+JInnRFTg5G73V+6iqt2VfVHEQ445+cHJFl
42Q+64pbT7aum1Ml7jqswwL/VTakkh+R+lnl86i5rtKmiezoJdD5cVOvVC3FA1iEihitJJlVbu3S
rO0Em5vrU/RpbvNOPiV/IX1Rde7rigAHdvDqUp4R7+5xKu9/Hh+QfraCDu9t6vB1qZ7n9KXch8iE
t6WR/u6Auq0Jn6SA/s+nR6dsH5US/yGhrsz6F+gYn58BXUmdYU0dX17GFatBjyPDdCMaM2KQgxjS
FflVJX38evOhrcOm5TytGVzB/kkLq/m6pR9R7hcmdm/hfuUYW7P+OltRVjVi86+QdV3BhfQmAUth
Jn3VLGjHdeuj7+Qk+T6jE1uI4U2K3p/it8ed2OfujuhQFKxpWaRum+BiWq3h/yJXvrqAb721zZrg
F8ilB3bo2Br3Bu+T0P+mVYTflA513G+XSAlOFd+MzsqIvjPxcl/9VGoahe83ABFhQgQGAR48CBCA
gkGEECZMgECBQQQHDiIkxBjAYQQKCDU+hMDAYsKFASg6eAiRAYOBEAM0oADhYICHI2FybKAw4UyM
JTP6dPhwJ4WcBgcSHWnSAc0JIx+kLFiSZ8KUDpNS/FgzY4CkSYNGZHBz4EsKHJdidEABKlmzL1My
3Hk0p9WESX8mZDmBwlKYIVtCcCuUqdO1Uj3SLGoQ8FOXDzrOXLDgQIHIkQcoKIBgAQLKkjtXTjCg
QIEBkg9YXmCAAAEDlxGIHv8tecBkzZwlryagYEFp0wcG/B6AIDRpzQlwf769+nRp3wUIHBj+/Dbp
BLsjZzZtHbtt1awvq369QMHq4Au2Uz5wGvRx8wiaS19tuz0C3AYiHxc+wED65LnlYy8tgJW2Eimx
rbZqwMADM2rAAQMbXDAjiyBEKzEKBXSgILwyjLDDAy/8kMMFRdLwpbM85ErBrUREEaMEMwprRRVT
lNHFExlk0cEWK7SxLgtPJLHHHT+0MLHKjkQSyf2SVECzJEGrDsojE4gSyQScfJJJ4SpToMopvYys
Sd3E2zKyK8fMMs0FqDyyzMjcRFIB9bgEk8wxxXzyyjbR1BM0LJM8TcAShyTatNAO7TI0UUUXZbRR
Rx+FNFJJM1IztdwqxTRTTTfltFNPPz0AzU9HzVTOBQSdNFUGDku1VVdfhTVWWRutFDpSb8U1V113
5bVXQXdNQNRec4XzTU2DzRMBYW9FdlhM/8z0z2YrhRZaZzm1Vs1s05zW026tXNZbUZGtVlNrBSyq
wUEVvXHWD9f1MEaMVtqVv2txVW3OAzTjDVPs4hStTm9P+/fafZ/sV9OE7c3y4IStu9fThxvml9OC
MbXvyIsjO3hjUOfM7uHSFMg4zYm5uoiBsmYs1Cd3D5yqRUT/6Y245k0vBvBW+XJlOGKPP51YzZxt
tvnnXoNOEjujOe25sqB3zvLkkRBl1OWXGZ2ZgSN9I6A6zETTbb8BunbvzfQIbk635gzw0jj9rlOt
Mnspc7sA3dwu2UwC3uY6yr71A3vNvfNOLYH09ib47da6lqw1BMQmgL7yvn6OvufYTm3s6g6X7sjW
7Bb8bfOak61rtxlH7wDlIls8ytZa2xrtwDnWHHDQ0fuN8L7FIw10yCXX7Pe9NeuMvwLSNo/1wE83
XHPKvvZ998rYptxL3xQPWDUDMO+77+M7w0xj0s2Lu3XPVucP8IwpI80+8zOHHUmUTYoJr4sEvKgB
vQAzaSdW/2MqS0H0p5YGPOAsBtQIATPygIg4aH91eYhHIjKBnByEIAmBQAMmEkAB7e9+eNGa3gxH
gNS4zz7OKWFornO23aAtNE0qT2WeM57lKEtu6inN8Ua3gBnqUIah6mGownQ8Bcxmh0HUmHv8Q0LV
Gc5uqvOMbmLjHDlRZntrKs32EpAZ1cmJif5ZmN0KYJ8ZSseIx9siEE8zGet0MTyTaRIT7RY/ji0H
bVwi4hmXs5tgMU6EULziFaeYGzYOsooQS98dmSNGMq5RjKHKognNgx7kcBE9eRtAH6kUnNcoADPC
6VoXiZgZxh0AkwbATA2r6MXbxDFkqNQhc0JpN/pEkY6Vmf/fUxJDQcXQ5AEsQYhhfoKQCCBkAgh5
QDH5R8GniGQCC7zgMSdizIpIJJnOZIhM3KIRwECgm4CJwAd/xbGMLac6KvRhaSJXRDntsTcZi9x6
3kSZh9krh6c5Jwk38xnjzLM9SUQkdPQJNS7icJ875KHh1IMd/tjGk5thDsEep57I2ROgTernQXlj
vOKIh40RRY0Pu4YdFd4woADd6B4zuaatlZOPWPxnQ9mnGZmeNKXa0UyTxOPRmVpnpeisTSXd8zxR
/RQ1/3GPS5X2ODL+aaW24Y1I3WPQ9FUHqgcV6RaLI7WLIMqbNKnIM+cnzJ74T0ACuuZCUKIRj/DS
rGtFmf7/6mKSthbQgBdhoEJyojKFFCSZMAphdpw22H8xZz+pC+jcsCSfq8YONcaRzmuA8xnG9rQy
Q0uPZH8jVIva5l8FvQ5NT2ObuoE0M5+dKmouu9jONJajt4FNGw1KGuBwxkkLc2fPMLtH1V2sZ/3K
oWixKlzX5naPvh3bFCsG3H8SVFnOEaLcCFDYg7ZHt8QDZUkHq9HQhtai6fNnaTwLnOBQV35TE6f+
YDK/sZq1rHBxzEAuwkxwUsC+e8HITNJyX4qIkyP3dcBB+IqV+9pXJ+wFoUklsxvdFPGf1gnNksD7
zvssdqD0RJJFrTpG+Tz0TRd+cHdT2mFRgdY6nnVSRRdK/1zKxFO27fmXilXb3SvVkrvZyUwRN/xi
nJrpwbg96WptuqYq6ks9y2lwcLOD4iVjOGR17PGVjLPjnF1GPEp2ricTEDfQFPnEnTGxRP/JGsLx
prExTu2LzYxhJrPUvEeaH9UgAhi4joSsJPGfeufnzaYoJSEG0u/9VtKViZylgsR0TFRcdOCsybOW
OiykfdjIw5um9IWvcWp1Yplh+4QnnlDdHCY1LWYhVzrUSewsJWGq2CYzWDY4HuqqDSo3SdtnpZuG
tY1jA9I2Pu8ypny1SW9aaihn8lJL0ttmSAjpntaUoaOl56iHDGxT6rqn9/RMc4W6JAfrLWx7RGo/
H43dzP9By4hL2ijdeA1SPX452+yk9siqFGdxJvAsRKGrXvP93oPANZyB2UnKJJJfj+A7rxJRWQEF
vipkjiXfay2mRsRJM9YND4vUMQ9u/FY845bOxW8a26UeNhzSyMY5NBXNSivzmtVI8U/guWlzVO5d
gzoUN2tccau705rm0WY86Jt1mKb71JDr5qbgcQ5rSLhu3q3GPuNxDpCHXfHwPFk1zvGSasoznFuz
OKbQttR0Oz6yoVenPiSE+cW7Xt3QRgdkV2dcfMAcPIsjvTYTE03LIfZz6Xx3OdMVORZh6XTxAF68
n6H3inzCmAkUJCgR57cxQSLWstgPJAv0iGNwYhSXTOT/8jOBiUdugl/9PWTigX0TmvA0HzQhO0uG
uw+Y+pQlnXLJhmG6/ZS29SaBrR5bAuNW27xUrCf5fvZP2hLxkT/8Tyn/TdnKve+9Bfwj+T73m6mS
9NWE0SQhAEvaT/3KqwRsJLkmS86vvrX6BKdtoSivQvozy1YELwnJH0MlehGP4sUieQH2Zi+/lDQp
IgNAIaIxwANEwARUwAVkQNWxFqRhQA95ina5mgr0P02JLo6hPi5Jj3BhwA8EwRAUwRE0QO97EpAR
QQ+pCAtkwQMZEAIxkP5rwRUhFBlsEQ2aQQqcFXkBkRGxv0exwQgJwklZiiFskSEcQh0klPzDix+8
GiP0/8FCUcJFiREcHBIo7JAXxCAE48IZfC8UobN6QxGsaEGrkZUw5IrKixA0hBWqiRA3nJSFiBlC
mUP32gozFBD+EcLFYJU6zEExdEE+bBkivAgy3Ao9lBBARBEt1Ak49EJFwcNHbJFIfBWX8cOycsRI
ycREnJVLdD9WIbgFwcNNdApQlMRE2cSX2cRRVMR4KZGIoIijAIwGWIwHWiCtGCD+KaayYIyC2MVi
eghfNKtfFMYN4p+nCCBYpEX84SCZUCCMyCBa5AhENIqOeAmH8CawyMVrdImt+EU8SyC3ioj6GaAL
QkZWkcb6qcaGWJkMiiCPCDBoLAuUmMa4sMZ54Qhe2v+gC3JGffQgt1DHCHAItHgIa7wgkyiRfXS8
+EIJ0tMLXsIrdHzInCBGshgIdFSLiNvGA5ugnNALdnQrqngMgbDGmRhHVjFGe0SIdGSgymNJWLxG
DEoQCKjHZRwgCbIvwPhI0LPFisSIi+jHhlyKoNSLIuSIC2KJmADKCrIvgoDJc0SZeOQKU3RB/NuL
tMgJpLgI/MI3vCCKp/ClaVKIX3KJiOsIlgCnYDIrg1RLb2KJDMG3YoKJigDKbzIJvPKvatKgrhQQ
olCvtPDFkAjLYwJMeIkJsZTDxgPLa2KJBoi4Yko4PasLokg4lXGgBLlKp8ygkoA8stBLvYrMkPyr
vPr/qq/6t7+SiYmYr18yyxzpCPXSJrmCRrv8N4FYlflair+SQ1bpM91ENLBSGd6ES2NiTbVspsVk
JsUUq7gIsMZbq4PQH2yazbe0zL/0y7OkIKwMvca8Cr1MuJFoCpi4zZVITrsKS7P8zbKqTcUsxEJk
T26Cz9SsTbj0xQeYy9BskAhYr31zxbvoTjvLCUA7RtnUzYTAipngzNxUS7gQpoUYOB0JULMcqwBd
CKxAlJO4H0N8P5nozm1SDEfENzvzM8Q4K/2xiJXsJbZCiwwNMP7RJrWKSOAcOExk0Q09jL8aEHwb
sKWwM7/ST7ESUQkRKw59pq/qib2qUAWdn70q0Jhh/9KtzLMhPQzZlAnZFFEyzM5CPIuQLEU8g87G
e4mfKAgHsdGkSFAzNVC6TNP//NG6KAgBaopSJFAohQv1VNKROFCEANC+7CuD0NISldAyxU2VoT8C
GRQYXVO8GogbmYquoNM8PTBIbdC1PDB5jKBGpFOdsNC87NChuK+7SlP2sggQrQso/S/7ypB8DM+L
NIgCO4zu5AkEzSVkkol6Q1SlcIxPxUdpUogC87MgHdUCy9RSXUvJJAlfhVSnaEoojZlc/TfDSIpG
vZ9+E1ZNLTA1PVX8Ilae2M0EyqC7CEWGQFOlGFcMTdREnRlVVdN+u58gjZkkhQs8vdOt9NWSkNdw
PP8mnchV+wJVBvqrIzxU9jJXDUqmG828OntUJU1QBqVUhrVXhfMrtexRPt3UjDDXEa3TnOhQhCXV
9iLDudBFHbEImRA9TsRVF5XYGO0LULxViuCJGAyLgfQJiuRROh1VQVM0k9UmPrvDRUvWH9VYZp1S
XnJXUK1T9mJXENJUQ5ufj+VEboULgp1RRisglC1XNY1UrL1YDCU0IzXXfgNSOn1XPws0stXTTM1K
YnVZczTOkrWJmKDKqvRPFp0QMNWmP3umtYrLBZXUUEVQilxQWcWKYsorYMLUfPuriv1JrT0RlKjP
Tt3bpLBCkmgI47wfosCKuWwKkfjR+lzRNI3Oxjz/XJ7Qi3VpWQfyXAxCiAHT02eq2IijSX07OMXT
IKJVx59sXbONSrF61qP1N7ENJo/8H+GVXcCQw5TJUj/toMToUn21IKo4kcG1z8bjzss916xdK8tk
075KuMzNTAYF3AMb25/VXTzNXdjV0sLNV7UC02K6igddxEGpCboFypYwEIfAL8bL2b7V3ccLXLUs
vWdSGYH4qvlli7isWYtl3IwIirxl0bgIxk4liZZQNJYg4DQUCMJtiYZ4i8/1s68oCAOOVTE04A/u
4D8ri3wdvaWo2ABW1M2zGpQACQ3hSxRuC/KtimfqVozIYfFtuEvNr5RoOBjuoAvuCwvuRhQmWS8l
ukvTY5AOBuGrvVqmEAjGJQyXSIsM/iW4/WEwvbOljdc/LdsVDoyxoAj9IWCdbLwGRlrr7c95YZED
WUE5/pFGYcIOuZAg2ZCEjONF6cEQoWMx1UEd+bMbURf485A87mMVJZBFDgsKLJD6y8IHWWQGsZDl
rBEUIWQVtL87dhFKhpdNppBNRuRARhBDnsIdqWQEqWNE/mNJieQmdEH+45A/vluAPcVc7sSe1WVo
BNNeVuXOBOZhJuZiVhSHKP9UuTXmZYaUuH1E+2TmCCmgaKbmal5maL7CZLbmbebmbvbmbwZnYmbE
cCbncjbnc0bndH5jdWbndnbnd4ZnLxzneKbnerbne8ZnZc7nfebnfvZnb57nfxbogSbognaXgDbo
hFbohWbo+G3oh4boiFboeZaAjKjoDrloD6nojJaAjrborejokM5oFOFokcaIixZpjw6AkV4Qlj7p
jz5plU4IlDbpmbbolMZomS7pkXZpnLZpjCbpA+npmA7pl17pml7pmTZplAZpo05qjQZppHbpo+Zp
ooZpoKZqnV4UpG7pp77pmt7pq3Zqjv5qn1ZqriaUoh5rmfbqCJlqVGlqozb/655W643+aa+u6rgm
6qXW65+e6rdWare+arL267F26sM27LYWaqi+a7VubKkW6pRma8Wma8fG67tu7LXGaZYmbMXGa7BO
7Msu7Mxe7L7WaLIG7NEWbL3u7NX27L+W7NSW7a8Wa8AqbcwmbZhmaqbO7dd2bco+a942bd1e7M42
7tzmabNmbZuObdyO6roO7eMebs4O7tvO66x+bp1m6+tGbuuW672W7qcO79r+bMkebbvuavHOaujO
buWO7eRG67jeadBubtG2b0Nt6rAO7e9OauFu7fUGbO5Gb7/2adi+6Y8Ob8I27skOatUecKpObweP
7vh+bwSvbQHn7+i+beDu/+3HZm/7lu7xBm/LVm/+fnALz2z4HuzDTm1DEW7mpu0In++3ZkQF9275
Lmr9du4huW4R524ez/AQT+z3ZnAIl/Ad5/AE3+8dGW+a1mrepu4Ob2vOhuzI7vHtBm+5rvLpFmsF
z/Hfxm4pT3AiB/D4Vm0Qt2oNR3ItpO4od24o9+xHGfAXL3EWd/H8jnECd+wWB3I0j+rSVnIpZ2wT
H+rLpvO5xnMkH24wX25Bb/AuX3H1rmy+9vOy/u8f5/H6FnIPr3T8LhRMh/MZ33MyT/Q4b+kKb2/l
XnTyHuz6tnSP1nFTB3Q1X+9UN/NHnPOc5nNFGXPztnJV5+pQ73MjV/TT9v/1Mm/xyibu7g5uGl+X
Y8ftQt/tQU/rDG/2ZH90ao/wbd/wvp5tbQ/0++72EU/1Xy9yAG/0Xdd1yy70Th/3VY/2wlb3b+dy
bYf3Yr/xSnd28qbpcafvEcfybO9vfkdsJn93Vi/4Vz/3KU/407byVt9ze/ftNyf4egdu2FZ1ir92
7Y74jcd2rD5wGD94fAd4+J5rV2d0VCf2KQ94fZ54Ri/uhpf5bG93da94kOf2e9/w/25wPv94mK/5
nff3kVf0E7/5dnftXSfyjSb1Ukd4ktf4Yld6Ukd6ojd1BtCNVxd4kFd5ZDd4rS/5re96lSd7lB/0
ro/pkIf5pzd1aEf3cj879Vvnd46Pe3Y3e+u++1bB+JN3e49XeFFf+HWXe1lf86yX6MNH/MSPZ6w/
FcV3/MeHfIA2/Min/Mq3/Fz/ZvzL1/zN53xZyfzOB/3QF/1E+Xxfd3KtjnTx3vKYbxF6/3QSz/ll
h3Sc5/odEYDbFwCMuH3dx33e95DdDwDc7/3gz33bL37i533gR/4OUf6MaP4DEf7od/7oP/5EEX7f
P2u2j/suz/h7Z/fYJ/oA9/e8l3mjF5DJl/2XJnER7+/tRu3nhvDT5/mqX3fEpnSkj/VJh/WZTwjg
BwgBAgcGCCCw4EGDAhAuVMjwocOIBSdSnJgwYsKMDQcSlMiQY0WLDUNCFElSIceOJy+SlDBRAsyY
MCu6LFgzwM2bL0/i1Elzp82QMyn6DNozJtCWMpH+bGo0ac+dRQMwULCAqNGi/zlpLmW6NGnNsDid
biUr9KzNrmKB+tS5FitbsGjhjuUJUePdlHn3YhxpVyJelCpNAmY5uOTKlH5JHryouPFCtU9bmp3c
lefbynXjQuXsdG7nzVDbcnY5tepVqWxldi5bt+3Q10FJP9UaWi1tt3BpZ/2Zk+lm22QlU9QIsi/f
wMoXJzbeMXDxjcz/flRM3S7kiscFn5zaWu71l26FBxdPNLNnukKJn7/8vffY01bVH4XNu+xU/Ejv
rwZOfjRduokmGmvgveXabeGJ5NhI2zm33HEs8RRhgypJiJxgjylYnYaJebSceAJ2t56AuMW24VH0
jYhWftd552JasYW1H0moxf/IGnqT1adfgfjNplmBXIkI4Gj+fXagb7Xd9tWLCl4YXXLToYjXk4RZ
+WSVGVqHopbPSQeRa8CVR12TXP41I24Dwifkmd2Z+KOBcFZkI2Y3DlUmimuZBqSOfabZHp68yQaj
kiu+9qaZHmLYZZaIbRcegwtuOeVjUkKpnYUNhTkXnkJ+Bah7iX6WXmh2fkpZknHGV+N8dbqq4nhB
DrpngKSKCRquhlqmY6ibGtoppnpZGSViITU6YYWYXlqssoxNqih2lv6aoJrgvYqqXQgKZx+vJ4rK
q7V6VssAAyqaS+Kp/8k44H4zoelVtvGC6q6nd8IaIn2IVmvsYgx2uKW/k2L/KW2l0vVbYYfNXlkp
dRcWjC+18hLIHravxvqpe+/aq2an2jY1nmoVLaBAuaWaPOqY565KpsSm4qhvrrvde63F10kY6bLO
Dsuvzsgq3LNH0Sp8rKT/HiyvibbtiSChdS4dccUsxjw1zVgVNXLJLv8Waoin7hho01F/qyvNXIuN
7Z/BPvqwzxxS2JzADLfNqJQJ050o22SzXGjaZ4erdctU9w141ShjPTbiiSu+OOONO/445JFLPjnl
lVve+OGXa7455517/jnooYs+OuSZk3466qmrvjrrrbuOOcmvyz477bXbfjvuKJqeO++9+/478MEj
vvuZJ5qGcb0nt+lyoSr7/80mqcFRfHeXQTv+6F9VYl+ds3Y/RPT30jZ89NxOil++3Q5+Of7bbted
qZYlqc+v983uPniqKLPrZ9dQS292u9a1vDHhjz43W1/OEpY3t3GHOwVDGPf0sj0PaShLkMmO+xq1
wMLQL27mW9jPeGa97K3vgCKEDgPL17YHFoR4g/qaWFrEInh9TGYfM9KomLavWq0JLNMzofVwtrOc
LQyDQqTSQtaWxMM0yzAEseASMWgSogERhE1kDvjklywoMQyFNhNWFQnzLOR08XxBw5kL0UMrwilt
N8QpUf7+57WUdU1WKdMYDqNltA6e0WBj1GIVcZYdJTaQggeTIs9AYkIqylrNipdyWCOH5pf6XZGS
WizawPhySRUCzYpp3FXzCMQnjoFSRDqUGLBI5DyteUtoktqZF5HlvSN+KX1/JCImLcVCLppxiJt8
ZC/ntshDbpFSuGRfMS8YMFjucpP/I2sVDJEEymnChzxBYlqOsjW91lVwkh784isLSSFFRnGL23tg
LZfoM3LmEop5G6c3LUnCB7EQQsE8TBZJiJIranJD7aMKNGFlvGimMpqBQ1XSyJbQebkLUX1DJyfh
JqzoOKeSJVTn/ArpT4zqspwjzOc8EdhJukEylopC4gYNmdJvgYhL/6ST/jaUnzn26XmlApvi/lM4
Zo0UnHDjHi/DJ9R/TrB6e4GiA6cDvnem05VmQiJFM2rSD+JNbmxraVQnCtWCwFSgGQsb/xi6P7CK
rWPb1Mo2hwjSiJLxiX6M6oIiGE+lHi1SXuzmSJcq0qIyi5FwLdYy+/lF8o0vhMvK/ygRUbgdOi10
W2Q9XgHBRVaCZpNqM4MUFjuKzpX+la/aY6JGmZlIkY42g271KbRMO9XCApZgpNWnEzFrWF+qlbBA
66o2M5ZWs8m0XreqKZnOelZ02RGXnG1cPjXYUYkqd4Q9fS50eRrSiTrVqCuMZFw/Ytru3VK6fcWu
wnArvPGSt7zmPW/qxIve9bK3ve5974bUC9/50re+9vWdfO+r3/3yt7+ey69/AyzgAROYSzBF3k6V
5z/KbM15aGVSHW/1xrIiuI6toSkPx1qbgY7IO2tsj4OJW9xVKoW3KhuS1SAG3CWlVXnA0piLB/i5
A0uNU9d0kXDtJc3/nTjDJhNUWv9i9iKv6TTDgtoxyODUI1Ly7cYJNmWLV4xi9UBWxy0TU5OG7MY8
/q0yMtyRgitHrpl9+csHdezKfOWritEopu+qobm0TE0pX9PKa1KznHpjTRXTMY5UPqhUzCznGImy
yjS8o9N0tedRpuu3fV7x5cZs4Rf6OMwGhTOt8BzKFG/YxB/+zWy2dugj+RaVAPJR88SVGyY/GrLT
Ak2WlXIeUjPYWit7NZjRxmZO8bqH0Xv0DiOdNSKV2abPe3ODPaNDGX34ZGvu8U1vJKp0qWrNyPZU
tbBspyVxhdZ6C8+UCRhoehG6yxyDjbdtvW1fj1rdkLacpGFIaXenCNyuimHTTpn/W4qtmrLpjkpM
EUeaZPMtz1spaLbNtMZFM9RIy9Z1yMJEbmCzDJuXFTWCi63KGQ8b0KcMFMxmJcclb5pwY3txZDET
8oYDutqizHOEN8Znyh48YgiXE8IX/kJr2zFpNZdsWCmuv4+LLt5M5la3bn5vmMNZ6EPP07z2Vupv
TzbG1aRjs5duWY2jWcQCnDcby4Nkc58N1UA3d9fLza5Wcs7of/qqqXwdcEDhnD3a9nqR566uxyq0
xNROcJCV7Gc2XibWOWS1gtQYbE7LhuATC7f/Ml3kv18a7l+Tu7Ava+zKvrvDlo5zxQddVhIjPl82
Nby9PZzw3gJ+y1EOcdWzvkrUQMvYspUOdpk4Tzm3vz73ODYx2nrv9zrPGu9RZ7mIr+VhuzMf+Fb3
LdufX/tE0b7lkPZ966WPSuFbP/MF/j74wy9cfq52fPzmPz/622v09LO//e7n3frfL//50/908a8/
/vOvf8ndf//+/z8Aogi5DCABFqABHiACJqACLiADNqADPiAERqAETiAFVqAFXiAGZqAGbiAHdqAH
fqAGBgQAOw==


------=_Part_2032967_1590215667.1669968032428--

