Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BD42141DA
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 00:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5E216C0;
	Sat,  4 Jul 2020 00:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5E216C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593816972;
	bh=Mcf+tdqunKIOrDZgF2tytTDtI/tVixyiQL6sKAYK7DA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNwehkjhxH9qaG0nb2MAaAiVvILqBt5KOufoFH4lutomygvo0Ci6BSxEc5hAtqtDV
	 JSRAxDV6LeLF21fvi5k+y2PWckqrjl/dRkJcgStwvwC/bH7h5MSQ+RRyr4A0n1C58D
	 ugflXo0noE+Ux/CSsvfEfnfcTSpwvjqKNJGdkn8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B84DAF8020C;
	Sat,  4 Jul 2020 00:54:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7BDEF80217; Sat,  4 Jul 2020 00:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29261F800E0
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 00:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29261F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rADDYge1"
Received: by mail-pg1-x542.google.com with SMTP id d194so12305029pga.13
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 15:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=oTkXaid7GNQFlYsfEdaKgaeUOuBmaSvEjnjEuHkyUUU=;
 b=rADDYge1q8I0zarVOuiCP1n2dmRmYyBGsy/hzGn98BWsvhF+fO8UEnYF/uYevcnz9W
 nhrP4oB+QqHV1nMJQTc1184IqisHW25ctgVTsb+JHzofrZyC11+C15Ll30Ah09WMEYIp
 DwnIhEKb3aCFGX97TKlx3fhoKhL2RFZv3DzxdW4PQX1/PH02RtgRU70uLjhE3H89rPmV
 rvAPF/2FhpR35IR22Pn1jZ8fbAh5HxEvh87QKNbFxY3ZKqZrNVBAIUe+Zl4w2BKU/Yb0
 0DtcJRDKdjITgVWxDxZ1KNglRN59Gs5W+MJ+C2j2LfupwzOq3EFblegWmxzI+QFz0Tvs
 69Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oTkXaid7GNQFlYsfEdaKgaeUOuBmaSvEjnjEuHkyUUU=;
 b=M/6NcP5ez3fcC+T2tNXo0+m39X5UGM71i8P/SaCmcxUpWVtQChxNYuchkB0UFgVO9B
 1gw6QzjckyXBp0vVF7SYoD05yqk61/7dHXY2/MqMo5LtWFM6SakSUK0tinZQKUi3RSAw
 pScqflDPcmdYSA9RNAcs6BydblOBkmrbNs4G+q1L4lmkOrQPj6WwKiXru0+iC6Vyw+03
 K1u3ofFcHfYy3ItBtTFQrwIcGrwiiRSgSEzxPfx+sl6XWWUbDsbdojfvlKd6qe6Kz4rV
 1vFg2NOtLsU4ilLr79fhiTOZbi/RGfgSeTOd7gjObba+6TJJfVPX+ZkiMBEAWOGwpF3G
 pMaA==
X-Gm-Message-State: AOAM530D3N50s7MdIrAQHKz24ltSmoqCKtXlRPqmmBW9RL/v9MJE38jv
 t9vODWPfVOMM+64CUp7RYHM=
X-Google-Smtp-Source: ABdhPJzPGC57mpfLFULngr/NnF0Fhw5PfT+pcnDnv2cckFMj9UhDHYp/0lgx64qalRF9BLeG1Dnvhw==
X-Received: by 2002:a65:6447:: with SMTP id s7mr31250183pgv.320.1593816858307; 
 Fri, 03 Jul 2020 15:54:18 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id v8sm5633794pjf.46.2020.07.03.15.54.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Jul 2020 15:54:17 -0700 (PDT)
Date: Fri, 3 Jul 2020 15:54:09 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703225408.GA16494@Asurada-Nvidia>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
 <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
 <20200703224656.GA16467@Asurada-Nvidia>
 <20200703225020.GB29047@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703225020.GB29047@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Fri, Jul 03, 2020 at 11:50:20PM +0100, Mark Brown wrote:
> On Fri, Jul 03, 2020 at 03:46:58PM -0700, Nicolin Chen wrote:
> 
> > > [1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
> > >       commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0
> 
> > You already applied v3 of this change:
> > https://mailman.alsa-project.org/pipermail/alsa-devel/2020-July/169976.html
> 
> > And it's already in linux-next also. Not sure what's happening...
> 
> The script can't always tell the difference between versions - it looks
> like it's notified for v2 based on seeing v3 in git.

OK..as long as no revert nor re-applying happens, we can ignore :)

Thanks
