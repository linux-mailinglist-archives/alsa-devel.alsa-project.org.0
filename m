Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B830228104
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 15:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2862950;
	Tue, 21 Jul 2020 15:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2862950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595338416;
	bh=Pt+GzWkxP1A5ATQGkWe9PChiAPBJRw+/ivN92QlY3LM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWpPT/J4qPnfwjRgek0nnmjxC4BZGbMdh9C3DifPB5R92zpkpYIaebExM2y+ya7Qy
	 F2n6E9xD178GyP9+Xww0OYL31jyVk0UHK++Rn3jTAuoUnDFpBCmei9eB+S3AysqngI
	 A68Q1vwPW19NnlvE7qj/rOHptaCQ2cz1VRvFXLw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E75BDF80212;
	Tue, 21 Jul 2020 15:31:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B8DEF8024A; Tue, 21 Jul 2020 15:31:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F2C2F80117
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 15:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F2C2F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R2MkfsCQ"
Received: by mail-wm1-x343.google.com with SMTP id c80so2862449wme.0
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uyBU0n93mYL4MPnVZSrUf3hQRNa7z/RTZ/TKuAjq3Q8=;
 b=R2MkfsCQuYWzdV3pwRrLaT8N1kzRpNcsFvr6wnqUiJrQk9jaPTpAwG9/BxmKH0fg4e
 csnBNsmMOvVrz/CJ+WpUAIOUa92I9kRfRCKd33NJX/RQ5DALtKWGB9IV/8y5YuU/FEGm
 ABQSVM09Kd1gfUDLlBqWcP6KdrcFWArxsSp6AkHFMYr/bnYPxQntffyf8B9orCvGnSZD
 kpIz2FAvQ6MLmX+RfADxPxmtyzNZ4rFR5tmSwBCK0I9/l1n0ZDpLwFbwZ9tSpvPX0XTL
 LQHQMEMxDFZ0U2xD6mGRCERCgYTrwUvl8rhc9PPSgVVavx2jLMlCN/QIytxMBrCHlFab
 81Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uyBU0n93mYL4MPnVZSrUf3hQRNa7z/RTZ/TKuAjq3Q8=;
 b=stEW3Q0GaRj8OY8pn8RXhngk9sCp+4ZEkO0+W07x2dPfKdULiFoQ/QPOl5Q+T8NSYO
 j7A8q0h6XJdIKsKU/DL+WTDUEsEIzkK6NvFINQAXhrVQnVbtay7qnQR38zkNhv/Plqlc
 Pvm4zka0RRe2+BYVYW8DYPT8iIN6B6QsrappYBiOFvTgohPigMMaeg7WoL0iB7BCbu+G
 BTMI9RCBGN7CxXKJGgKoKzUMu8GlzcBi160DCpf/rC0SVd1cadw1NcBbxZn1xzRWdMVc
 mBavVI3wP8mgNHFXvyJMW84ePc0pwKxKh3JwtDRu08c5VYPgC/wXGwMKD8v5M1MCxfpX
 67hg==
X-Gm-Message-State: AOAM533tGWtjOKLioVotvMaB61uYo71IJ+fEnmbs5wB4AQja+W/sqrTq
 rZFbVZA3o3U1vXBvGpoFzOU=
X-Google-Smtp-Source: ABdhPJzuacQT/Evp2PHZb0CQXYblt0HAY+Bj+IAqC14Rd4DQUDuO+4iTsHjhrA3NqW8RBRIhAaQjlw==
X-Received: by 2002:a1c:5453:: with SMTP id p19mr3983422wmi.41.1595338296463; 
 Tue, 21 Jul 2020 06:31:36 -0700 (PDT)
Received: from [192.168.0.74] ([178.233.178.9])
 by smtp.gmail.com with ESMTPSA id j8sm21924758wrd.85.2020.07.21.06.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 06:31:35 -0700 (PDT)
Subject: Re: Speaker pops with max98357a on rk3399-gru-kevin since v5.7
To: Tzung-Bi Shih <tzungbi@google.com>
References: <f2ca985f-7dbd-847a-1875-dd0e1044ef02@gmail.com>
 <CA+Px+wU1S1EqtW-yZH9z9aCF3ggSriBqy73SRYy8q61x0GkdQQ@mail.gmail.com>
 <846feea6-e2b6-3a0e-b05f-d70e898f9ea5@gmail.com>
 <CA+Px+wUhAHAx-qmAEWy_8Jy40NDTAHH-TNYtPtMfwocMHQ=AbA@mail.gmail.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Message-ID: <ba020dd4-167c-f67e-5cf7-5e4e60a71919@gmail.com>
Date: Tue, 21 Jul 2020 16:31:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+Px+wUhAHAx-qmAEWy_8Jy40NDTAHH-TNYtPtMfwocMHQ=AbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>
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

On 21/07/2020 14:46, Tzung-Bi Shih wrote:
> Hi, I got a rk3399-gru-kevin and can reproduce the issue.
> 
> Could you take a try on the proposed patch here
> https://patchwork.kernel.org/patch/11675533/ to see if it fixes?

It does eliminate the pops, thanks.

(I've replied to the patch, I am sending this for completeness as the Cc
list isn't exactly the same.)
