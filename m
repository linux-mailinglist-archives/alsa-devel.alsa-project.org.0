Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 868FD557868
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 13:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35EE41EFF;
	Thu, 23 Jun 2022 13:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35EE41EFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655982439;
	bh=dLoi3KKzuSD+LuC4bRF/Z1ooCSce2SSv1xOKmR3YBwU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdxgyHcc4boFLSx4/A9rb/5tTBKO5xGUMs4BmOH/XE9bI+ilWERdfKC4yNzPo7aiS
	 aVcxumndmrPaStTT4CgPEApR4VkdqJLKpXUrHodySvF1aN4dzC6yo4GRvDaJWAFVgh
	 Y/ZC4KOrJ7XbjAM76ePt+VL7iVaqOavydfEfpXyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B97D4F80566;
	Thu, 23 Jun 2022 13:04:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06902F804C1; Thu, 23 Jun 2022 12:25:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 910F8F800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 12:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910F8F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PIkKFT6M"
Received: by mail-lj1-x233.google.com with SMTP id bn8so5396486ljb.2
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WqCHtUCnOvJqjoM2/65DgkYvOyKmc4p+aq7/u8FCyxA=;
 b=PIkKFT6MmcaUETNYYp/00cGxbMns4B3hZ5K5nmtGI6rNA0GIEW+mljG/Fne1m1MoDJ
 hEob9rUTJYEcXgm+2VfxUeSgEiCC4beWQTqOtIjvrmPzJY59yY0aQjFSYFq6uZ+yCsBY
 TkSAwqVecLhSbMBWc2qGK5asYINBDeVKWuZfIJIRPVXH2ooAOk+CilaQasEiFEnBPvo1
 9yU7sRGCq0pbvG7DXQEPHm1Bepg/+EXQeJ5lKtflHEWo024/pU+tCE0tyKXp96P7eK6/
 MtHCviPz6ujkgIRgMZdT9HQ/BMuTmBvX0T0E+5sbw8JvnmtJwX+DR8LPIVdwao4FUT9T
 fbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WqCHtUCnOvJqjoM2/65DgkYvOyKmc4p+aq7/u8FCyxA=;
 b=kSM8XIKf45P/UIH3XJ4aAt6PRl3RaZD/mUHlwyQENw+B3i5hG3kTcOp8lE6k0TZlZY
 6YJqN0/nKMF6qJXtEmIJwevZm2rouoBPSyMYXupFGcVINMjdzyXdmlMpyjq1DCczE7JG
 dVpJmXjfLYxcxFwULH/uMkbFsaPMWUSd8E+OTUMxkkGdPgiRiSlKrmcLflACdb36oXrl
 x7UXfLYfhvjcK+vrS3fkAAIfGO23iG1VluKmjTlg4mJxuNj+oGBtioevJ2qbJ0ZApW8p
 /DW1XQVQthSX3kVM5rtiWLu39Ow3tLDXDXpxBRtYynm/XO2JlWITEpT0PcknA/NNKTwT
 wcSA==
X-Gm-Message-State: AJIora+jN8/1PW8BVl0ediOOuqa93OdSFG8nYZtnuxWMfeB5OBiWxui+
 fVxmxwVeb7BSukObz4b/llA=
X-Google-Smtp-Source: AGRyM1uzm9hmF9QK316rJoAfTTvEoAQhcLS5DK1sh8QXwvTquRMs7E5mQ7FvnFV0WtaDWVYa8qbSYg==
X-Received: by 2002:a2e:a883:0:b0:25a:8d91:27b4 with SMTP id
 m3-20020a2ea883000000b0025a8d9127b4mr2875724ljq.509.1655979906447; 
 Thu, 23 Jun 2022 03:25:06 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a2e9641000000b00253deeaeb3dsm2727519ljh.131.2022.06.23.03.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 03:25:05 -0700 (PDT)
Date: Thu, 23 Jun 2022 13:25:02 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor.Dooley@microchip.com
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220623102502.jiksqr3m6y733haq@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
 <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
 <a2d85598-76d1-c9dc-d50d-e5aa815997cf@conchuod.ie>
 <c272728f-f610-77df-bd9b-c9fee6b727f8@opensource.wdc.com>
 <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd2547f8-e069-60a2-a223-9f694457636d@microchip.com>
X-Mailman-Approved-At: Thu, 23 Jun 2022 13:04:32 +0200
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, damien.lemoal@opensource.wdc.com, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, mail@conchuod.ie,
 tglx@linutronix.de, dillon.minfei@gmail.com, lgirdwood@gmail.com,
 jee.heng.sia@intel.com, linux-spi@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, palmer@dabbelt.com, daniel@ffwll.ch,
 dmaengine@vger.kernel.org, masahiroy@kernel.org
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

On Tue, Jun 21, 2022 at 04:06:21PM +0000, Conor.Dooley@microchip.com wrote:
> On 21/06/2022 00:17, Damien Le Moal wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 6/21/22 07:49, Conor Dooley wrote:
> >>
> ---8<---
> >>>>
> >>>> hmm, well I'll leave that up to people that have Canaan hardware!
> >>>
> >>> I will test this series.
> >>>
> >>
> >> Cool, thanks.
> >> I'll try to get a respin out tomorrow w/ the memory node "unfixed".
> > 
> > OK. I will test that then :)
> 
> Since the memory node hit that dt-schema snag, I have not sent a v2.
> Going to be AFK for a few days, so I dropped the memory node change,
> changed the spi binding & put the series on:
> git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ canaan
> 

> If you get a chance to look at it great, if not I'll send a v2 once
> the memory node is figured out.

commit 84df6ca0f277 ("spi: dt-bindings: dw-apb-ssi: update
spi-{r,t}x-bus-width") looks good to me. Feel free to add my ack tag
to v2 of that patch.

-Sergey

> 
> Thanks,
> Conor.
> 
