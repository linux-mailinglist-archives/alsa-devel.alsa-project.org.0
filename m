Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFC82EF86
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 14:11:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46CF7209;
	Tue, 16 Jan 2024 14:11:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46CF7209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705410678;
	bh=i4dry6M6WDVUsf16531MxNHkF/ieE3KAF4x/oxtezNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=siiSykdeCIEGxkqV5iSe3DVloWcdAFyLE/zshl35RKI7gYIHjX0K2R3SHqeNz29YD
	 y5F+qt716Q1R3d3VNxlFiUoBztnr9ifPBsCiQFuitBo/svSSwE63ObMugD+hRfE5vu
	 z0nNkamSnVZ1LGwKdqAxsG6lGmm6+x5YrryXvUow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D68D9F80587; Tue, 16 Jan 2024 14:10:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C748EF8057D;
	Tue, 16 Jan 2024 14:10:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B79F801F5; Tue, 16 Jan 2024 14:10:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71DFDF80074
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 14:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71DFDF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oDhj0ufm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6FF89B80DCD;
	Tue, 16 Jan 2024 13:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C9BC433C7;
	Tue, 16 Jan 2024 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705410616;
	bh=i4dry6M6WDVUsf16531MxNHkF/ieE3KAF4x/oxtezNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDhj0ufmBZ5rhO3OPZzmZDuzn9J90cGHPEF3adOa7IMzTRLXaZV8Khdd0rmAMF7uV
	 xHL3+MkX22jLdE1SRP3SEZdWUmdK/vaubuGSljwLzIZwx851xPFEnxuYQxDMZHmeN4
	 xQFtajGQnZNKQJ0qHzO1I+PRphGmAcAkMhVha4UnfFp2w9QL9TuWOJGylInnhAnxmH
	 RTiGLN1xKE/9HhRETXXIV7h8u0Rw3e3e7IdFE6Aex92sBHh1GepwBotSwxhVGrNvCh
	 Um+7ZN8Ltee3ql6l11b3vrvEY8inpgpGSS/NksYL6I5isd9hQ+MqSqW0149552QpOP
	 djgnIp4WMSTJA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rPjCt-00065Y-1B;
	Tue, 16 Jan 2024 14:10:20 +0100
Date: Tue, 16 Jan 2024 14:10:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/7] ASoC: codecs: lpass-wsa-macro: fix compander volume
 hack
Message-ID: <ZaaAO8SMczq7YUAE@hovoldconsulting.com>
References: <20240116093903.19403-1-johan+linaro@kernel.org>
 <20240116093903.19403-3-johan+linaro@kernel.org>
 <8bb1cad6-6a85-444a-b881-c03ab0051009@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bb1cad6-6a85-444a-b881-c03ab0051009@linaro.org>
Message-ID-Hash: ITOAVINTGRLCOIDGALI2JXOPKT6X46K6
X-Message-ID-Hash: ITOAVINTGRLCOIDGALI2JXOPKT6X46K6
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITOAVINTGRLCOIDGALI2JXOPKT6X46K6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jan 16, 2024 at 11:10:21AM +0000, Srinivas Kandagatla wrote:
> Thanks Johan for this patch,
> 
> On 16/01/2024 09:38, Johan Hovold wrote:
> > The LPASS WSA macro codec driver is updating the digital gain settings
> > behind the back of user space on DAPM events if companding has been
> > enabled.
> > 
> > As compander control is exported to user space, this can result in the
> > digital gain setting being incremented (or decremented) every time the
> > sound server is started and the codec suspended depending on what the
> > UCM configuration looks like.
> > 
> > Soon enough playback will become distorted (or too quiet).
> > 
> > This is specifically a problem on the Lenovo ThinkPad X13s as this
> > bypasses the limit for the digital gain setting that has been set by the
> > machine driver.
> > 
> > Fix this by simply dropping the compander gain hack. If someone cares
> > about modelling the impact of the compander setting this can possibly be
> > done by exporting it as a volume control later.
> > 
> This is not a hack, wsa codec requires gain to be programmed after the 
> clk is enabled for that particular interpolator.

Ok, but then it's also broken as, as I mentioned off-list, these
registers are cached so unless companding is enabled, the write on
enable will have no effect.

> However I agree with you on programming the gain that is different to 
> what user set it.
> 
> This is because of unimplemented or half baked implementation of half-db 
> feature of gain control in this codec.
> 
> We can clean that half baked implementation for now and still continue 
> to program the gain values after the clks are enabled.
> 
> lets remove spkr_gain_offset and associated code paths in this codec, 
> which should fix the issue that you have reported and still do the right 
> thing of programming gain after clks are enabled.

Removing the offset which can alter the gain, will cause both of these
writes to become no-ops as the registers are cached (e.g. just as for
the follow-on codec cleanups). So then we might as well just remove
this too.

How is the half-dB feature supposed to work?

And are you sure that you need to reprogram the gain value after
enabling the clock? Everything seems to work without doing so.

Johan
