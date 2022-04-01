Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B3C4EE5E9
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 04:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4612C1888;
	Fri,  1 Apr 2022 04:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4612C1888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648779196;
	bh=rs9Tek2W5T0R706rFsrCl9RXT9rcxHjOFhNJyoUnoOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VJwMnWiatW9I1Ka4ROhZdNOteyQkMlFsGVRZdvpVM1jho7RgPg4IhC9uCxkM0lCz3
	 LyGe2jfzCK1eniCni6ptZFJOcq+vhjyuf1U5YlxRSuSv0kPWTLgy6po3bwYQKswJfN
	 7wTtEMPggaHbsUhZqS4H4fKD5/jUsRldIZRV+8CM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4C9EF8032D;
	Fri,  1 Apr 2022 04:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58878F80100; Fri,  1 Apr 2022 04:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E41CF80100
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 04:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E41CF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UOYSEjNC"
Received: by mail-qv1-xf34.google.com with SMTP id ke15so1004738qvb.11
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 19:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tfF4jMoourRXWty+VeiIwmu3poFQSsT7at+4kHLppy4=;
 b=UOYSEjNCt4hvd1B3augR+23XTiJ93+NZvhnXrjnOQu1PLlGGuM5kE5DTveWmUYsJ4F
 w4zNDyY/pfzHfNS28LbSqNiFA8sxRW/3PJySNvuMKwvhTEoEJprO3kjyr4UA2W+Zm+Q1
 Bw0hjwHG0lUQOfRS/7gUFksaeiuU7nSMAHrD2pMn2e90Xdma+bIMvXZoQVBgzJz9KSE3
 0QlZo7pjve6cb7nG1842znWNewGcnKis4gv2L8Z2XF2HERAMdxbJrRrDSVDKknyKYC6+
 47OCiaWkmmCsdg0U1gFsCX+KBqemmaPe3o8VatmtPVljCKff9gm6WiRSiXsNW3iC1NcH
 dqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tfF4jMoourRXWty+VeiIwmu3poFQSsT7at+4kHLppy4=;
 b=UG8RzE/3btyqDbqsSfl8EwIuhqzSQY3GnJldslzdhB42uzT6o8dqcEBYLwM3ct/mT4
 Zywdf3TEiCXcRH+yOyKmBH9GkkiUmirQrYeqb/jbQQ4OSAuAhK+rK8dQPTvKmjq1nT6N
 9layUBzDrSfZBbbAvPKyqCne1YA9r4srBrZfyv/ISRH0IyHCGT90Sk5l2I/mOdmEUhbQ
 DOjzvOEAbQAh5HBakO50IOhZ7c4LvgGiohmQRynKu8XZoKpxUGffNASA4shb7OA5lXtd
 WVv86dJB5IAlTwfLn9y5Jj63yIR+hPB6mzozU02OsWDhb94p+KnXrXF+c3M5LX3mu782
 W8UA==
X-Gm-Message-State: AOAM531vXhoJqYtZIpSwrNZdvO/I2iAgfFWop8qd2nAzQvwJgCEh9eQF
 uVmDwWpj3AxF5a2HGG5gdP21Wie0xf+j4uikMNg=
X-Google-Smtp-Source: ABdhPJxzRZI+WONbFlobAstHM9ajemhoLTb/bdpcboZ7nAT4a/jycTUcFDcLDacKgW+Geq1QQGLspmi7s/8rNimfeGo=
X-Received: by 2002:a05:6214:1c85:b0:443:8347:d7a5 with SMTP id
 ib5-20020a0562141c8500b004438347d7a5mr11363444qvb.11.1648779120601; Thu, 31
 Mar 2022 19:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220331215003.882143-1-jakobkoschel@gmail.com>
 <20220331215003.882143-2-jakobkoschel@gmail.com>
In-Reply-To: <20220331215003.882143-2-jakobkoschel@gmail.com>
From: Baolin Wang <baolin.wang7@gmail.com>
Date: Fri, 1 Apr 2022 10:12:42 +0800
Message-ID: <CADBw62qyyisDy2NkE29GYZkCi_O5Vgp+t1jeZtOkPsLV8UGFGQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: sprd: remove check of list iterator against
 head past the loop body
To: Jakob Koschel <jakobkoschel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Bos,
 H.J." <h.j.bos@vu.nl>, Yang Yingliang <yangyingliang@huawei.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Arnd Bergmann <arnd@arndb.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Mike Rapoport <rppt@kernel.org>
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

On Fri, Apr 1, 2022 at 5:52 AM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>
> When list_for_each_entry() completes the iteration over the whole list
> without breaking the loop, the iterator value will be a bogus pointer
> computed based on the head element.
>
> While it is safe to use the pointer to determine if it was computed
> based on the head element, either with list_entry_is_head() or
> &pos->member == head, using the iterator variable after the loop should
> be avoided.
>
> In preparation to limiting the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
>
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

LGTM. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

>  sound/soc/sprd/sprd-mcdt.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
> index f6a55fa60c1b..6e27789a0df5 100644
> --- a/sound/soc/sprd/sprd-mcdt.c
> +++ b/sound/soc/sprd/sprd-mcdt.c
> @@ -866,20 +866,19 @@ EXPORT_SYMBOL_GPL(sprd_mcdt_chan_dma_disable);
>  struct sprd_mcdt_chan *sprd_mcdt_request_chan(u8 channel,
>                                               enum sprd_mcdt_channel_type type)
>  {
> -       struct sprd_mcdt_chan *temp;
> +       struct sprd_mcdt_chan *temp = NULL;
> +       struct sprd_mcdt_chan *iter;
>
>         mutex_lock(&sprd_mcdt_list_mutex);
>
> -       list_for_each_entry(temp, &sprd_mcdt_chan_list, list) {
> -               if (temp->type == type && temp->id == channel) {
> -                       list_del_init(&temp->list);
> +       list_for_each_entry(iter, &sprd_mcdt_chan_list, list) {
> +               if (iter->type == type && iter->id == channel) {
> +                       list_del_init(&iter->list);
> +                       temp = iter;
>                         break;
>                 }
>         }
>
> -       if (list_entry_is_head(temp, &sprd_mcdt_chan_list, list))
> -               temp = NULL;
> -
>         mutex_unlock(&sprd_mcdt_list_mutex);
>
>         return temp;
> --
> 2.25.1
>


-- 
Baolin Wang
