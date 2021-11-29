Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3283D460F37
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 08:14:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948A117EA;
	Mon, 29 Nov 2021 08:13:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948A117EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638170042;
	bh=57oTTRSNx9YNMs4ihpm8haSL4gRbD5XmDEw05r91OaU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LF0yQYyq7FmY7LkFUrel365zcmYsxrD3k53/+AQJDqbGxxqGbzgFntSj/YAQWWuBV
	 qBiipTPLp9N5ilmxGdknHXislyrwTT6w2FLgboHbsuQ02UY+EacQVGMJ3ZF/H58mBT
	 OoBdM5XxP9bAK5aaVAm/WSR1hhMuYMmNpBTvKgyI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1930F804E7;
	Mon, 29 Nov 2021 08:12:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 987E2F80256; Mon, 29 Nov 2021 08:12:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 425D2F80246
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 08:12:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 425D2F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Sjv5tuU3"
Received: by mail-pl1-x62c.google.com with SMTP id y8so11451257plg.1
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 23:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XOVClEjHy2YCmmxBNWZViUvkZtP1AdWZ7jyiRVXX/3Q=;
 b=Sjv5tuU3YefSTVzJGdWEKxum4VaFMKb5gxi04NlC81VNM6HCAfuQLXGCZMvt83jl0B
 095duvMeJkcxy6vpoByoMGLUVgoALS4C9E4mvfyeJgpTr3CfyPC4V7mK292GP9L41NYJ
 J1CNIFmMyGbSsvEgUUarFrLyxv/z3D2jvMJymtJP4B69F5Wk8evpoEVg26aowPzBqPlx
 a0DrZ20URASj+2Zc/cFzyir3b2v8oA8iqJawkdIqTcKILSNUyaRrejfS+HJdInNrbrdC
 bxhXHDSafZMIAajFSMvxtE6S/cK9ykm51ZAsZ7ufCBS7XPoE+jfqT7dr2UCXUTuiQ8qv
 7WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XOVClEjHy2YCmmxBNWZViUvkZtP1AdWZ7jyiRVXX/3Q=;
 b=QyQHtuSwtp349ETCHHwsimwa51PnOmxx77PVeK1mWUhzhpWO9SFhMUZA6ueC3Mnt2y
 WdeJopcEHqEnYeqTMebA7loBtY0/yIW3HusvHg7WKgkI/Rjfx27pKmnbcb5spw/s/vWt
 CXrCxuVvq7VC7tBHIrqZ2f7lX4y0+tTqk4UrzxSgvlkJfff0tvjnWIH16nJzmZu2J0we
 DEWjXMPYF05V20Fuz1bbhEjqi91/UuKhLr2IasSi5PCN3RECeLfqaOgYgijaUQSXu2nL
 QZIfJM11GzD6RjKZCmLYyQka3r46fcHkyu5t1z7DH3d9xYmGZJE6aRyZKY89qp6tI2wl
 kglA==
X-Gm-Message-State: AOAM531abZjJSaQFeHiH+1xYUnWTrB/Kd0febQkcsFw/Dr9UgLkspw+5
 2F+/QxEObIoIYBSZacTboWy6hQ==
X-Google-Smtp-Source: ABdhPJwOh28YXHGKAJUi7kIV5rLOOLWW21lh5L1/C7V9rKaGzWrMqT4TrSV/3iTvTifnRN+wFK+7vg==
X-Received: by 2002:a17:90b:1643:: with SMTP id
 il3mr35457906pjb.182.1638169937067; 
 Sun, 28 Nov 2021 23:12:17 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:3807:fdf3:5573:47d6])
 by smtp.gmail.com with ESMTPSA id nv12sm13818886pjb.49.2021.11.28.23.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 23:12:16 -0800 (PST)
Date: Mon, 29 Nov 2021 15:12:12 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v7 3/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YaR9TN7Aad5DYCg1@google.com>
References: <20211129063954.1616-1-allen-kh.cheng@mediatek.com>
 <20211129063954.1616-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129063954.1616-4-allen-kh.cheng@mediatek.com>
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

On Mon, Nov 29, 2021 at 02:39:54PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch is to for MediaTek ADSP IPC mailbox controller driver
> It is used to send short messages between processors with adsp
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Please double check again if you use the R-b tags correctly.  I have provided my R-b tag before but have some more minor comments below.

With the minor comments:
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

> diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
[...]
> +static const struct mbox_chan_ops adsp_mbox_chan_ops = {
> +	.send_data	= mtk_adsp_mbox_send_data,
> +	.startup	= mtk_adsp_mbox_startup,
> +	.shutdown	= mtk_adsp_mbox_shutdown,
> +	.last_tx_done	= mtk_adsp_mbox_last_tx_done,
> +};

Rename adsp_mbox_chan_ops to mtk_adsp_mbox_chan_ops looks better to me.
