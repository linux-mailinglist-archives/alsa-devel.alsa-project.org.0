Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1C2D0D8B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 13:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4E11654;
	Wed,  9 Oct 2019 13:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4E11654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570620048;
	bh=vgPoF9v0RUyPmzx2pwIhZ5fBmJHhYP7Sy9aDpTatyro=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jj+P//heF/gh9DsC0W24E6J1dml/KjZ250unveaTGxvcb9eOYsQNq9Ozq7VXlaH0d
	 syPHPC0w0LqNYVlg2fv+kWdrhA6HiycIl3DUkx1amBlDFFimFxjgTb5Pe5Rd7fhcnZ
	 fSrIddgBuJhLAw81YwjjVDsbgWG7rjMZhq4oPcJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1CEDF800AE;
	Wed,  9 Oct 2019 13:19:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A54F3F802BE; Wed,  9 Oct 2019 13:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ED63F800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 13:18:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED63F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ru69PyPe"
Received: by mail-wr1-x444.google.com with SMTP id j11so2436409wrp.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 04:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X1jBx8b8NTy2Q+Af6vxHBjKqe3YVW97aJiNQNQGtrZs=;
 b=ru69PyPe0UtYrlO/fyA+tolySxWWh0Ch6HqnMTAtHHU63224V0uSWQjeuEoK7lxhif
 TLINXhqaPeOvatqyJJqiwgh2R7n9yd0ZrvVghtgbPYL50A32STy9PtJK122BtLyuDgqS
 BQ2DeEIj8s5vQhtgsepH8uAfRPud/cxE37wTeQfEhvz40Xb435njt+MNGptf8MZPsikx
 E1t5k0sgrwLsfh9hvjc32efWCEeRMsNXCQy4CQ7wLNSyzujYH/KIH+WLHyQLZ6EftFml
 0JcpwTqvitm6j8YjQ+04LnKS8ASqm9ZcyRAgQUis0hWri/03bPuMdNAdXutJL7XQMj5w
 CkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X1jBx8b8NTy2Q+Af6vxHBjKqe3YVW97aJiNQNQGtrZs=;
 b=ok9qMMMPmawX1ZwSB1+pSXpOKJ4Q8+d5y0RtOPq/Igx13OYOi8JNcC34ysU87SfNF2
 4BAfVRoOwxwBLLwYzKtUdkUDXmfJS+VOCFH0xhpfi02nFeSrnm/Y2lQtO+m9Fl2V4U+z
 v22tLR/DtfeGHCHRFlZdNQGkFi3lbl0yLAXNqp2jGSY/nSGzvqCtlKMtB8pNuyv8pgK5
 oGord/DcCfMjmyROrOmU024UYuNHgEGr2fhQcDiY8v5uQM0Va9etDvRyKwtXjfymur7J
 DY7U8zS3nfDwEARzQjjQAtEH58l0SLDRP0SNPMBMNggGRVumz2a43MXVIFYF/JBclbVK
 HSdA==
X-Gm-Message-State: APjAAAWHtxcVUe+vrbQVOjxIU2/6IJPDtG54dNkfqnFylPqZf2A87vRy
 zaiirYc8tzGboz2fLjxqzEwo+tO4wIY=
X-Google-Smtp-Source: APXvYqxK90NuL8YSpTznLuil4RbL0kVK2hvlumjqRtekolWQ80AbDoBVvWylDdHxvWRHsLRIZ3qg1w==
X-Received: by 2002:adf:e542:: with SMTP id z2mr2546457wrm.188.1570619939169; 
 Wed, 09 Oct 2019 04:18:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t13sm4100538wra.70.2019.10.09.04.18.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 04:18:58 -0700 (PDT)
To: Stephan Gerhold <stephan@gerhold.net>
References: <20191007181952.34786-1-stephan@gerhold.net>
 <6d324680-de9b-8fe9-5093-abb7cb1f1f83@linaro.org>
 <20191009111541.GA170307@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d7dceb5f-dc2b-afa3-87f8-fbfdd68447cd@linaro.org>
Date: Wed, 9 Oct 2019 12:18:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191009111541.GA170307@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Remove broken
 MIX2 DAPM routes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 09/10/2019 12:15, Stephan Gerhold wrote:
> Thanks for the patch!
> 
> I think your mail client messed it up, but I managed to apply it with
> some manual fixes. It seems to work fine too:
> 
> Tested-by: Stephan Gerhold<stephan@gerhold.net>
Thanks for testing!

--srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
