Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C1E465D90
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 05:44:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A6FF258B;
	Thu,  2 Dec 2021 05:43:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A6FF258B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638420275;
	bh=XLu6Y0NWrmUwXYTDyPvK+B71iCu0TYEvaxgXLo4z8aU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pT/NEDWja75ogd3YIerhCB/FIYoCrnDNfx8NsZcegPaWRtuEa8A8/hqtjfOyDizEE
	 QebYi0jjefwlwHUB2tpuNkz+kRZvBixTNNCsNP/7zw5DRcq8TIa94J878QCTcOztIa
	 GC4+X9j/V3JOoAt9UfjgVVtmCtX6HyrHzTGxVqzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F7FCF804E2;
	Thu,  2 Dec 2021 05:43:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C07FDF802E0; Thu,  2 Dec 2021 05:43:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E42B3F80290
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 05:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E42B3F80290
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="E13Brcty"
Received: by mail-pg1-x529.google.com with SMTP id f125so12595537pgc.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 20:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QPV306Cl1hLkT1aLm/ztTcGSxnCGdiyQM9JvOmh+VBI=;
 b=E13BrctyEiJmk8QUej4+qBU++tdSGEmKsrgPFCfx4zr+AVn8a28NmmgnY75romMi89
 U7ILmdqSDi4IqU1FQskq+DfQT48XCLWbZJLMOpXKWLcwy2RD/8q48vl9tFE+2fXPsZVR
 +ZI+StjehXpNDVvQ5L0pIKJzXtyXOPfQ4mivaLwcwCFo1KCxzlZAizfhCRjTso+t4G+L
 wJgw60wiDhYBTdWf9RshLHW31L2CmL6O4QuDIZMQeurga3UCgV1R1Yyffw6RafTgFsrC
 Vo2cHqAgDqh1KK0SqqfwDrOZ9Uix5RsQYB+cLuVHGj1NDgJE3P7oVXFxcHf73VIjQ65p
 T/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QPV306Cl1hLkT1aLm/ztTcGSxnCGdiyQM9JvOmh+VBI=;
 b=OWMfLrSiLI06Ma/TKMiai56D0jg/hsB8GdxT0ETEJX0Nh5wJeaJixABGbia3C5zso/
 EdVCgDcJCd4Ln9psJ3ITE+8kPwD1x89GkT+Ko0+Jakuw2uuJeMpxa5GctICIqfKhpjhL
 mvrxaDasFR/Ly2LoyBdrMimjcY6mrxV1SqZWI9o4YEKjuYpfhEAN9jGgoNJDsAcCVOvS
 fLsIIGBKA8HVvy80MOsso6UHKyrOQj+C1DP8kHnkT8ENuF9BwaomWsDacSTizdmY+UCE
 QlJ8sGBIGi1tWWOWGIJRUxcokUl8oveuV5TEm807SeP22zfZ3UFw4Zma2Qlq/RJYQ6kA
 cmJA==
X-Gm-Message-State: AOAM530diFaUH4ZEIaAj9IqaFoBqKxogZqYhqbxSw0LAl4WQmKVavVIv
 yUTSlJFjLa8hDde7/11FeeQsfQ==
X-Google-Smtp-Source: ABdhPJyChYJegnkY59sNvTlcAnuBxHuEZK8rD2ydV4fBqk/D+T3tW0FLAm3x803r/bwHx62jIBYF4g==
X-Received: by 2002:a63:d17:: with SMTP id c23mr7912840pgl.207.1638420143063; 
 Wed, 01 Dec 2021 20:42:23 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ce4d:ddd8:41f4:d987])
 by smtp.gmail.com with ESMTPSA id p43sm1426664pfw.4.2021.12.01.20.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 20:42:22 -0800 (PST)
Date: Thu, 2 Dec 2021 12:42:18 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v9 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YahOqtgkkj+HmlJ3@google.com>
References: <20211201075604.27864-1-allen-kh.cheng@mediatek.com>
 <20211201075604.27864-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201075604.27864-4-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

On Wed, Dec 01, 2021 at 03:56:04PM +0800, allen-kh.cheng wrote:
> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static const struct mbox_chan_ops adsp_mbox_chan_ops = {
> +	.send_data	= mtk_adsp_mbox_send_data,
> +	.startup	= mtk_adsp_mbox_startup,
> +	.shutdown	= mtk_adsp_mbox_shutdown,
> +	.last_tx_done	= mtk_adsp_mbox_last_tx_done,
> +};

To be consistent, s/adsp_mbox_chan_ops/mtk_adsp_mbox_chan_ops/.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
