Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DC212C89
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C6516A8;
	Thu,  2 Jul 2020 20:49:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C6516A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593715813;
	bh=tjLnDqCHJ3tlKBHWpYaMQtT/heZ2bcvPRFaX7GO4fhA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c/wZ0xrvqQpXfCxqV7G74+QwExzF0bXLYtSVHs5GFlrJNDxwYUoJ6TUIX/N5Fcxe+
	 bgC8fL2IMgTZaiKMC3ELz/s3LK7s7AB+QM3IpsLPltgjOnZHEIlS3059uZ9sICC/9w
	 kpIZfuUHQkN/DHfedjoDwtfCaLkDTmoVYBiXqZ5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2852F800ED;
	Thu,  2 Jul 2020 20:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84612F802BD; Thu,  2 Jul 2020 20:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78AEEF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:48:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78AEEF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FTHnMqQ0"
Received: by mail-pg1-x541.google.com with SMTP id t6so13906017pgq.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 11:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4BlDCKXOS7pXvqwXxqNjKYulCrchCC2Y4PnA+71ZGS0=;
 b=FTHnMqQ0vFzPe5NX8PYMPQ/vnegWez+WHEPhh2nmxzXbfXlQP0DiIyTz4f2zcZ2BDE
 r1txHNFmzGKrYoRDQdMUEXLSdu2b82OK2owZWBiVkAf+nvXI0T2PskI7scOpG/RYtiGc
 TYn256t9fboOAJig+jJ83xksT4wXLqwRvexijyg6iw/lsPaGE+DBiXPbHHv2vgF4vX3j
 pZGLto3bgLJTcqdsG5f2k3ZvfRdWyWkVhvzii59vmIBb6cgfIehN/WERNUpReAn6sP+a
 tGc2HURUZ3SWnkXzNWO4+fXbM8SI5Z9JrozkLFZfHB8wtFSApn1bGnkIMSBxCfzACMMZ
 SqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4BlDCKXOS7pXvqwXxqNjKYulCrchCC2Y4PnA+71ZGS0=;
 b=fXeoXtRJP1inHzimswcay1DH4m/XfKl11kjh4SjqEYJsQw8xzBFgYFL1IpDMxuA3dq
 G2xHGbCDzE4t8L1tmJcD1TfwzVcrsQ+prTRgo55bod54EjpWK6cCWlgs9hPtLgUfquT8
 pFsZAAFlThZDHN5ziZ8+8kTpIX1vp8pW+N8HebpFMaj0AZH6l9FrCKs83F2Lt93kvfIQ
 RCnAYeVQuax58ScPwPvLtsUxKHeNyMFbm+m/06yOzFmK6WFL2T5i7067aj5kecbnyOSG
 P55k3ub2CorD95qXRUNN6cOSLlwfA574cRbcFLImKvNJNZguwqcoAeK2FcEtY3AOujgO
 wJRw==
X-Gm-Message-State: AOAM533dkkxRr0MWUYonMyvZREGcVHdiv8NFt/wjYrZ+FYuwROtgAxBg
 gWUJ5vR834Ep7+ti878BS3U=
X-Google-Smtp-Source: ABdhPJw0IEP+truimaQl+gRg0nVTV93ibnpqE0yESRZ/GoJYfFWTUvB0mD72OigVZjVlmaeVpGhpbQ==
X-Received: by 2002:a62:7650:: with SMTP id r77mr19282735pfc.235.1593715697849; 
 Thu, 02 Jul 2020 11:48:17 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id x7sm9884013pfp.96.2020.07.02.11.48.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:48:17 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:48:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/6] ASoC: fsl: fsl_spdif: fix kernel-doc
Message-ID: <20200702184812.GE23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-5-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

On Thu, Jul 02, 2020 at 12:22:25PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. kernel-doc syntax was not followed and missing parameter
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
 
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
