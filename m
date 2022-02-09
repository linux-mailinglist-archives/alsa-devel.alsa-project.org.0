Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE304AF479
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 15:54:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F6A18BB;
	Wed,  9 Feb 2022 15:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F6A18BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644418499;
	bh=YzpRvE9sYwMooJhu6gtFdh/sLA4Wwx2lRemIcd9fgF4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3QNvsGDDiib32C76Zw+iPwWeLZhHgqcIYsWHjo5uft/KDLnYwocgusmzPaa/vEx9
	 snbxmtsWrw9eX9PHlKHlZIZv8qBIxSEVrKTeKFWjKo/rRBseVVko+rStdW1fE5UdX4
	 3y4ovVxgj7SYK68YqFYJGrK+GrNn1ZUunwWqQtdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D8EF800A7;
	Wed,  9 Feb 2022 15:53:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F692F8016A; Wed,  9 Feb 2022 15:53:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AF47F800F0
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 15:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AF47F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="SrFthgA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1644418422;
 x=1675954422; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=7CQYk6KBoKk7dIRV2fjpNgILKzEG1pLt+z4NMNp5q4Q=;
 b=SrFthgA8iAjPB4hesHF9v9OsLxfdrJ+/UldpajWeq5a2sTsKZoBibh3s
 QVzU2JLMsru7UYyjn/e6o6o/BP6jQo3N5Z4tWP+XDPpmk2PB+D5EnNLov
 PeomY7jUGrrcs6dNx7rbcoCxV+IPJd+PmQDLyl2p7Hce6mO656atBqm2S
 tFIzySyxoON4r9skqelFRoaI6UIykd0PNHhMTxATk3sOQN6YkxJmjlr6R
 qAWozYldBflMhOkFRK84PPyTlgaJxtkNe7xLRF6uEkzdo1jfZheN2tRFc
 qVediWl4nd8jHbmv7KFCq0t+MDR9ombIO+a7DPJnXjCa8KShNbzGnRaCV w==;
Date: Wed, 9 Feb 2022 15:53:28 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Add IIR filter configuration
In-Reply-To: <YgK81R6ipwLagmoE@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2202091518030.21772@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
 <YgK81R6ipwLagmoE@sirena.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail07w.axis.com (10.20.40.13) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel@axis.com,
 Liam Girdwood <lgirdwood@gmail.com>
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


On Tue, 8 Feb 2022, Mark Brown wrote:

> On Mon, Feb 07, 2022 at 06:12:06PM +0100, Ricard Wanderlof wrote:
> 
> > +	/*
> > +	 * Coefficient RAM registers for miniDSP are marked as volatile
> > +	 * mainly because they must be written in pairs, so we don't want
> > +	 * them to be cached. Updates are not likely to occur very often,
> > +	 * so the performance penalty is minimal.
> > +	 */
> > +	if (reg >= ADC3XXX_REG(4, 2) && reg <= ADC3XXX_REG(4, 128))
> > +		return true;
> 
> This is typically done for suspend/resume handling as much as for
> performance, and note that reads do tend to be a bit more frequent than
> writes since things get displayed in UI.  The driver doesn't currently
> handle suspend/resume but it seems like something someone might want.
> Other than resyncing the cache (and see below for that) a cache will
> affect reads not writes, writes should be affected unless the driver
> turns on cache only mode.

Isn't one consequence of caching that writing to a register which is known 
to already have the value to be written are simply skipped? 

I remember having that problem with a codec which did not have any means 
of resetting the codec other than power-on-reset (i.e. no reset pin or 
software controlled reset). If the system was rebooted without cycling the 
power, the registers would potentially contain non-default values, and 
this meant that for instance attempting to explicitly set the sample rate 
to the default value was not possible, as the regcache assumed that the 
default value was already set and thus skipped the corresponding register 
write. (A workaround was to write another sample rate and then default).

> > +	while (index < numcoeff) {
> > ...
> > +	while (index < numcoeff) {
> > +		unsigned int value = ucontrol->value.integer.value[index++];
> > +		unsigned int value_msb = (value >> 8) & 0xff;
> > +		unsigned int value_lsb = value & 0xff;
> > +
> > +		ret = snd_soc_component_write(component, reg++, value_msb);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = snd_soc_component_write(component, reg++, value_lsb);
> > +		if (ret)
> > +			return ret;
> > +	}
> 
> Again, this looks like it should be a for loop. 

Agreed, I'll rewrite it (and the previous one).

> This also seems to be doing single register (though sequential) updates 
> for the values so I really don't see any reason why you couldn't enable 
> caching - the only gotcha I can see would be providing register defaults 
> causing only the MSB to be written if the LSB were the same as the 
> default, that could be avoided by just not providing defaults for these 
> registers.

I'm not sure I follow you (or more likely I've misunderstood something 
about the regcache). Each register has its own address in the I2C address 
space, so for instance assuming that a sequence of four registers has been 
written and the registers currently have the values 0x12 0x34 0x56 0x78, 
corresponding to the two 16-bit integers 0x1234 and 0x5678, say one wants 
to update these to 0x1298 and 0x5643, with register caching enabled, this 
would mean in this case that the writes to the MSB registers (holding 0x12 
and 0x56 respectively) would not be performed as the regcache would assume 
that the values do not need updating.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
