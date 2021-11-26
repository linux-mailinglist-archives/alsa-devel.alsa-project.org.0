Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA445EB17
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 11:10:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59BE18FC;
	Fri, 26 Nov 2021 11:09:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59BE18FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637921439;
	bh=RBh1m9Iv9ako7axP5H+hwKAtAUmpp6poVdly3oinc9w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UzQ5BallZ0m+KycB6q978aFpH8QHwHgz8qqeTGmsj5j5nNG7WQy0Zns8E0jaChpru
	 tDEQj7zyY6aeAqHX0iJOUN/M73Lw/zd1lb3KDzgCqm1Ylpz+BYvCN4aHM6pj7iTKrG
	 3qgEjtNyJuEu0jBQJoI88Ie1SmZ+8YpKwju81vHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3DC7F80087;
	Fri, 26 Nov 2021 11:09:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4260DF80259; Fri, 26 Nov 2021 11:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1860F801F7
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 11:09:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1860F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="IPkErYmm"
Received: by mail-pf1-x42f.google.com with SMTP id p13so805829pfw.2
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 02:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4W2I5kuwpM2lqQ0SftJKxJYAD53bRmdrJ6iZIfgDzkg=;
 b=IPkErYmmP/MP79xguXU0HZSMDDIrG2wd7US1TxW/lxQfYNasxnfDdJc1Fqr8E9aXxS
 vszY6dfUJQzI0hMkvNQpjC4t/XTiL7rEQ1JWt8ontYmbu+VFFU0dqE2uCBFL0zRXjsU2
 rG5AsTcwffVpz2uKA55Ef79HwxOOeQnMuQC0jyaY2tbHSZ2w9NN0133sDpmaDdv2+kXC
 OGjnyPpGKdF6gl6JZVoaijU5R6+Dt+laQixKm9HgeAwTd6mQ2XXp2GpTSGXaC9CI9dtE
 9GEFFGI9Y6P498ovhEiNrHBGxLZ8P+pXgGG9wWOsDtlPdUBnTQovSuLGpW1SUzq3KHDj
 lV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4W2I5kuwpM2lqQ0SftJKxJYAD53bRmdrJ6iZIfgDzkg=;
 b=LpF7DyOP7Q8yUVa+jhJKWYpBLCoECH5z0bCYl0i/5HwUBe9gNk5+kzBCCg+anzGK7D
 /O765RngodM4+Tm3gq/dYrnelHEKDZi/L/h/76iZNP932SzezG1UQQcQXyOV7dpzP2fv
 VYEsIAuWoOTozxH+flES2gikgn1YDLik3fX7mSUTjQdroCjOQkr9aOrKM+m7N/pHf2BP
 nBAQHzXhGYJjQkKr+Zf9DfbbHOFu19HoX3/4za2TiBI3vZGiKt/RNHDdGwxAxpXqmmXi
 mDMbun7OMgHRVQAFNqtWKDEKfKjHGm2s/Oq1xOf/wo+uLAdaFyOaVL8h6S7hRWKyngyO
 h3Bw==
X-Gm-Message-State: AOAM5305mnRrMhACT05xyVbL0Ho5toaJQNXqbLfmXa9K2WwOeSN4QedL
 oDG98IctAm7u6/4s8l8VD1MiIw==
X-Google-Smtp-Source: ABdhPJxVejTdV/NyrWHwGiaTysIUv3zOhCVavwvpUaitec33azBmmuhOyA8uIgkTF6FDl0OeFLILPw==
X-Received: by 2002:a05:6a00:2349:b0:49f:db1d:c378 with SMTP id
 j9-20020a056a00234900b0049fdb1dc378mr19747281pfj.53.1637921344428; 
 Fri, 26 Nov 2021 02:09:04 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:5eda:d984:1426:91ca])
 by smtp.gmail.com with ESMTPSA id lj15sm5238017pjb.12.2021.11.26.02.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 02:09:04 -0800 (PST)
Date: Fri, 26 Nov 2021 18:08:59 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v6 2/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YaCyO9kKWJ8oog/h@google.com>
References: <20211126093021.25462-1-allen-kh.cheng@mediatek.com>
 <20211126093021.25462-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126093021.25462-3-allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, cujomalainey@google.com,
 Daniel Baluta <daniel.baluta@nxp.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
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

On Fri, Nov 26, 2021 at 05:30:20PM +0800, allen-kh.cheng wrote:
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

I have provided the tag in v5.  If your have no major updates for the newer patches, you should carry the tags in the commit message.
