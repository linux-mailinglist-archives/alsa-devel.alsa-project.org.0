Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2D46D2ED
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 13:06:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA20C26C1;
	Wed,  8 Dec 2021 13:06:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA20C26C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638965212;
	bh=6b2xQlxkllsLWXsbVGMjNFYObtqFt/iNsheNcaVXqUM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bf7zd+kginnek0kVofiQAsDzmKYQEV4nCpSC/xS45DczkwJevUc7A3xfOFnyBNaiD
	 zCKGOM2EaVBuPFQu0pYmqniZYlVdOXOkFC8AZti1Ep0lvi4B+JogKjfPfWoVuNKsIs
	 M14wgf9zpvVbZXtr3O7kd+zcx8wzMkZcriKINJH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B69AF804E5;
	Wed,  8 Dec 2021 13:05:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50163F804CC; Wed,  8 Dec 2021 13:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A171F800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 13:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A171F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y3IqVnsv"
Received: by mail-wm1-x336.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1617964wme.4
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 04:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ggHGJ4ATATJMFS5LIR5L0EQNDYKwn8R71jjvqFWzLSE=;
 b=Y3IqVnsvfYRZnb7jQ5fpjr2A9Dpom+OyCLn+5X9UeZQRzpjJ8+jqKZoG3T4xoudKQe
 so6xUF2Exkx1Ytc5VYjehSl1Zxqscn0ZIynmeHi8HObY1wozje4uOs9mbNV0dWQYAWrJ
 kbU7v4ty8pSp6jkGbzUnp6U09fbvf6Jn1LebIGmRg5b2PYHTqppzSHHdkKaBPet7rVne
 TK16Ht6FqA/TFovE+sLLaj/eL+uWACrl8T319In9TFtVfTIxNnMyDQeCzsictampXTtI
 VocJnTgO0VRtJMhrusZGsaVfnHzUaxIchfTGS9bq/7JHc9MRu2fVYHZEJz8OoaBL3w26
 duYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggHGJ4ATATJMFS5LIR5L0EQNDYKwn8R71jjvqFWzLSE=;
 b=GNniBH+nzTX8M6E1vJMexRnW/gk3RkSVc2RXICQS6mcL4h7KTfsZWSnlRcYiGraJEI
 s5MK9qOPmRA+pSGTd4ftSVwr/XY8jmphvSyTyisul+r5mUW3pzhliesOb8z3Bps6dDbm
 LZMGze5a/x5VM0PFeK//dyUzI6QDnOMq/ACeBSLhBybfQgDgoJyn2eAJqg8mRBlYwy8B
 Bo6IpO81Erypm4gl+YVo0F0dZsDWthwF/lKXVD4Pd5ros7DXj3+qjPHZM46/rzIckpNK
 0scj1NUyOFw9vKk88nGgsZOGpkPVqMZhLvTU4CoGFAOpxEzUqUmIybcAlIqz7VSiyMMw
 FxIA==
X-Gm-Message-State: AOAM532D6csftPffHxyVr0KkOoXSN5chVouC6CAMBKhsPcXRNr+WJPv9
 2xb5WbscbnG6llQk0xGEtn4=
X-Google-Smtp-Source: ABdhPJxDw+jb3ycmttv6BO+Ycld5++UZj4ia2guGsxPME+dZWL34ZxONGd6q0UcfzPJCt2/NBhUH2w==
X-Received: by 2002:a1c:2685:: with SMTP id m127mr15694113wmm.42.1638965131343; 
 Wed, 08 Dec 2021 04:05:31 -0800 (PST)
Received: from hamza-OptiPlex-7040 ([39.48.199.136])
 by smtp.gmail.com with ESMTPSA id f8sm6230901wmf.2.2021.12.08.04.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 04:05:30 -0800 (PST)
Date: Wed, 8 Dec 2021 17:05:26 +0500
From: Ameer Hamza <amhamza.mgc@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: test-component: fix null pointer dereference.
Message-ID: <20211208120526.GA12550@hamza-OptiPlex-7040>
References: <Ya9YxoUqkATCOASh@sirena.org.uk>
 <20211207142309.222820-1-amhamza.mgc@gmail.com>
 <TYCPR01MB55814819F7AAAC654084615AD46F9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB55814819F7AAAC654084615AD46F9@TYCPR01MB5581.jpnprd01.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "broonie@kernel.org" <broonie@kernel.org>
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

On Wed, Dec 08, 2021 at 12:05:46AM +0000, Kuninori Morimoto wrote:
> 
> Hi Ameer
> 
> Ah, you posted the patch :)
> 
> > Subject: [PATCH v2] ASoC: test-component: fix null pointer dereference.
> >
> > Dereferncing of_id pointer will result in exception in current
> > implementation since of_match_device() will assign it to NULL.
> > Adding NULL check for protection.
> 
> Previous your patch was already accepted,
> thus this is not v2 patch.
> git log should indicate is replace of_match_device() to of_device_get_match_data()
Thank you for your kind response and clarifying the process. Let me send
the updated patch. :)

Best Regards,
Ameer Hamza.

