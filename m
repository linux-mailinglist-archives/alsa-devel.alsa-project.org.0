Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F346B89C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 11:15:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48DB523E5;
	Tue,  7 Dec 2021 11:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48DB523E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638872140;
	bh=dxVr7LHBEfypd+94DUgR/ceiR5OW/7sIyVSlLLasJ4A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Amc5w/i+mlsHJIuV3WBQGcHW3gUn96eM9/XhCKLOVCrXEyGe0aHDFALh7mptYynoQ
	 nDUt9CduVnDJ+CleXg7ueJRY0r34q90K0rFoRnsBkBQsfdAqZAo/uIQcHJrKf38j1V
	 eVcJzFqZxQdlbTFYOZaweomjmE7nLq2+hzh/hpGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 350A6F8032B;
	Tue,  7 Dec 2021 11:14:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25AA7F8028D; Tue,  7 Dec 2021 11:14:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABFA3F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 11:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABFA3F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Vn7zKGIN"
Received: by mail-lf1-x12f.google.com with SMTP id n12so32433737lfe.1
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 02:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e8kee/N0as/hz/cg2sQd2lCPZnQthggdydHn9mrSiqU=;
 b=Vn7zKGINM/TVnj1QqZzCB4RhDZXr5GvFm0DDRUrZ6icbPApcWsfZsMgO3UiLD70BCF
 uOkV0ROYdKwHyS8iLSIkN28MswjzfnkK5zQDX5w224RopqbJPh2c+yUgiSikKsyGin03
 THJ+OPgdAymtIiMRMASPqRzXhZL6jKYBt2KKP6DzuUDGusT7YXjoPRgF0Xq9gcmi2jiJ
 PiEKuxjAGYMU0ndESLlKnF9fIjcWEAYuIQmKAbIaND9+F8vbhETUOZVOY+We4DEiyjzL
 6kOT3gjLdor4/ZjtlRdY3Ue7n6NZ39ksC0xMa7w/Cc5QVbmHESP1CAm2AFRocceomZbv
 FMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e8kee/N0as/hz/cg2sQd2lCPZnQthggdydHn9mrSiqU=;
 b=ySsa2OO8LKZWQaF5ADa4hfveWjJa/+xKwjEGJ/Fk3I/argjDvQ/wtzWlrFaQxY/oPj
 OhKrKhYfHMgva2HPXKJ/OWTCIQal1E5cP5v/fR1TEJLcqvGF5oLN1QjjzF9shMl11stv
 w/OOjhqhsUxCL4nvjCcdK5nKfnjm+Un/+RmItymJ6uIH4JVaNKPOlO87BRwSoj4iR/GX
 Sr5QLiUeooNK6O5IpsS9GGmbI15WCD6b5ChKY9TPjgNcwNgjOW+nK45YIBIo1tn2GjAd
 6GKTPl+l8yH0sAJi2KV7+SYBbBmy+jxMgyVQc3QWN/oY/fk+//OhZ0eknB3CWZmArBP/
 z6AQ==
X-Gm-Message-State: AOAM532bTf54t3ZtrxIcG1K0fS1Z+LK5eAn7KFslgyPZ1T32IWuO9oLt
 J4BIfY+uuJtYBPARwZgJOqg=
X-Google-Smtp-Source: ABdhPJzQGDXpxQbq645M+Cx7NqFq4GuTvMkGZHqWfLldEcnTBw1AkZi7CP1LNhMvfB00h76mxuu0Lw==
X-Received: by 2002:a05:6512:39d3:: with SMTP id
 k19mr39194848lfu.81.1638872057999; 
 Tue, 07 Dec 2021 02:14:17 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id i18sm1635047lfu.67.2021.12.07.02.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:14:17 -0800 (PST)
Subject: Re: [PATCH 2/3] dt-bindings: sound: tegra: Update HDA resets
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
 <1638858770-22594-3-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <13d20227-ec6b-03db-01dc-b4b00038a15c@gmail.com>
Date: Tue, 7 Dec 2021 13:14:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1638858770-22594-3-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com
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

07.12.2021 09:32, Sameer Pujar пишет:
> Tegra194 HDA has only two resets unlike the previous generations of
> Tegra SoCs. Hence update the reset list accordingly.
> 
> Fixes: 2d8f8955fe02 ("dt-bindings: tegra: Convert HDA doc to json-schema")

The original txt binding was already wrong, this "fixes" tag is wrong.
