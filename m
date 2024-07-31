Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4782942785
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 09:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 070BBE7D;
	Wed, 31 Jul 2024 09:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 070BBE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722409670;
	bh=DxYj0k8cH2mRzu6X3HbgLur3mDxmu+xBiLex6wyTmFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tWDFJXlk8uDAFwQ6oJZQ13Sui/ql0l+P2ZpSwO1sSx9qQU+vTJ3BnlZq/1inFGLYH
	 yv3grAvFDrW9Ng6vkSmGcYEvPG1fWxGAfMsvFfggHVHtY5YpgiYDH/3Oi9vTTPbhhx
	 v6YmvnvEdFwAFtzP2SNjqtPm4lECpGFKNxpi5LRQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 020DDF805A9; Wed, 31 Jul 2024 09:07:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34835F805AF;
	Wed, 31 Jul 2024 09:07:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C155F8026A; Wed, 31 Jul 2024 09:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F7CDF8026A
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 08:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F7CDF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CgKyiKWv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 021E761FF6;
	Wed, 31 Jul 2024 06:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FC8C116B1;
	Wed, 31 Jul 2024 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722408979;
	bh=DxYj0k8cH2mRzu6X3HbgLur3mDxmu+xBiLex6wyTmFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgKyiKWviPnt+df/P+O22U23kPuJr7EIR5Ye0Bt8dmpuF1cLqszzr1PbjBVjKw86L
	 iuwcnDTfn5/GWrAG3paET9NlrpGX6oC4Ks81Pate5V7U/K2dSLH+5TKzKSHrlB1sL/
	 6KDf17G2unb6Vr5aDnVBoXsZ8Bk6Lz44e/n4J8MsptFwwYC9CDSuviEIcGI0v3f5fi
	 AyNDfXWpkQeDc5kOKOeMQpUYjwwm4s8wVDz8l1YqKVL8zhw3hLRoTCYCa5J1xyWnrp
	 cZiua7wgFeTvjdlqbb0eLmtU82G9jpWAjS/2FOhX5PFKUcztCqHuhpleRoEGQoRkUg
	 25V5+ZfT9leMw==
Date: Wed, 31 Jul 2024 12:26:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Shreyas NC <shreyas.nc@intel.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
Message-ID: <ZqngD56bXkx6vGma@matsya>
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
Message-ID-Hash: YBCNAX7CU45YDBSBHM5HAPBJJCYBFOV7
X-Message-ID-Hash: YBCNAX7CU45YDBSBHM5HAPBJJCYBFOV7
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBCNAX7CU45YDBSBHM5HAPBJJCYBFOV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29-07-24, 16:25, Pierre-Louis Bossart wrote:
> 
> 
> On 7/29/24 16:01, Krzysztof Kozlowski wrote:
> > Two bitmasks in 'struct sdw_slave_prop' - 'source_ports' and
> > 'sink_ports' - define which ports to program in
> > sdw_program_slave_port_params().  The masks are used to get the
> > appropriate data port properties ('struct sdw_get_slave_dpn_prop') from
> > an array.
> > 
> > Bitmasks can be non-continuous or can start from index different than 0,
> > thus when looking for matching port property for given port, we must
> > iterate over mask bits, not from 0 up to number of ports.
> > 
> > This fixes allocation and programming slave ports, when a source or sink
> > masks start from further index.
> > 
> > Fixes: f8101c74aa54 ("soundwire: Add Master and Slave port programming")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> This is a valid change to optimize how the port are accessed.
> 
> But the commit message is not completely clear, the allocation in
> mipi_disco.c is not modified and I don't think there's anything that
> would crash. If there are non-contiguous ports, we will still allocate
> space that will not be initialized/used.
> 
> 	/* Allocate memory for set bits in port lists */
> 	nval = hweight32(prop->source_ports);
> 	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
> 					  sizeof(*prop->src_dpn_prop),
> 					  GFP_KERNEL);
> 	if (!prop->src_dpn_prop)
> 		return -ENOMEM;
> 
> 	/* Read dpn properties for source port(s) */
> 	sdw_slave_read_dpn(slave, prop->src_dpn_prop, nval,
> 			   prop->source_ports, "source");
> 
> IOW, this is a valid change, but it's an optimization, not a fix in the
> usual sense of 'kernel oops otherwise'.
> 
> Am I missing something?
> 
> BTW, the notion of DPn is that n > 0. DP0 is a special case with
> different properties, BIT(0) cannot be set for either of the sink/source
> port bitmask.

The fix seems right to me, we cannot have assumption that ports are
contagious, so we need to iterate over all valid ports and not to N
ports which code does now!

> 
> 
> > ---
> >  drivers/soundwire/stream.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> > index 7aa4900dcf31..f275143d7b18 100644
> > --- a/drivers/soundwire/stream.c
> > +++ b/drivers/soundwire/stream.c
> > @@ -1291,18 +1291,18 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
> >  					    unsigned int port_num)
> >  {
> >  	struct sdw_dpn_prop *dpn_prop;
> > -	u8 num_ports;
> > +	unsigned long mask;
> >  	int i;
> >  
> >  	if (direction == SDW_DATA_DIR_TX) {
> > -		num_ports = hweight32(slave->prop.source_ports);
> > +		mask = slave->prop.source_ports;
> >  		dpn_prop = slave->prop.src_dpn_prop;
> >  	} else {
> > -		num_ports = hweight32(slave->prop.sink_ports);
> > +		mask = slave->prop.sink_ports;
> >  		dpn_prop = slave->prop.sink_dpn_prop;
> >  	}
> >  
> > -	for (i = 0; i < num_ports; i++) {
> > +	for_each_set_bit(i, &mask, 32) {
> >  		if (dpn_prop[i].num == port_num)
> >  			return &dpn_prop[i];
> >  	}

-- 
~Vinod
