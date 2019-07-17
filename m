Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A0D6BEDF
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 17:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC20168F;
	Wed, 17 Jul 2019 17:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC20168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563376613;
	bh=x3zyCwwwurNjclJUUdEDRgIzq7xp4otrVWsPIbHU0Pw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vU5f7jnUo+fUOAzJLgDy6M/UtO/K4uW0O8uxql11MKmdb8aJT3e94gePOlvGADcZG
	 7g7KVZPlkZlKOb0/IacbFWQLkXCaaZqHB5Kz7EwgMesRjR+v9PxsF8vnicNOExWAsQ
	 GSZtMtAJe77u00gh4/WPEpEoSCtB05AS9cyahxPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72649F800C2;
	Wed, 17 Jul 2019 17:15:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF689F80363; Wed, 17 Jul 2019 17:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37350F800C2
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 17:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37350F800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="ZsmeSpin"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="ZsmeSpin"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 77D734E2006;
 Wed, 17 Jul 2019 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563376500; bh=NBe5u10z2G+wBsdcBQV/427TM3Ba2mjl3PARiRoitSk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ZsmeSpinkuvydcD/OgHosPoLRcYYJXxzNKVsRnrtw6Gccs5Qrl/rx45QHL5fHCe3l
 +IJHBG8v7LIQnT8NtAN/I3p55i5HEfjKGaKAiaOAzGnny4Kbc0lE7i1Os6dOgmwF0G
 CWSlb8TrtEms03+0qT0PdW9RkIcSZLnvQF/Ky1zs=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VGhYmmfoALP; Wed, 17 Jul 2019 15:15:00 +0000 (UTC)
Received: from www.akkea.ca (node.akkea.ca [192.155.83.177])
 by node.akkea.ca (Postfix) with ESMTPSA id 0C4084E2003;
 Wed, 17 Jul 2019 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1563376500; bh=NBe5u10z2G+wBsdcBQV/427TM3Ba2mjl3PARiRoitSk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ZsmeSpinkuvydcD/OgHosPoLRcYYJXxzNKVsRnrtw6Gccs5Qrl/rx45QHL5fHCe3l
 +IJHBG8v7LIQnT8NtAN/I3p55i5HEfjKGaKAiaOAzGnny4Kbc0lE7i1Os6dOgmwF0G
 CWSlb8TrtEms03+0qT0PdW9RkIcSZLnvQF/Ky1zs=
MIME-Version: 1.0
Date: Wed, 17 Jul 2019 09:15:00 -0600
From: Angus Ainslie <angus@akkea.ca>
To: Daniel Baluta <daniel.baluta@gmail.com>
In-Reply-To: <CAEnQRZB96Q4stM4JsJskMhdH-7ktbc-QxPeibNOLHEXghtS-1w@mail.gmail.com>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
 <20190717105635.18514-4-l.stach@pengutronix.de>
 <CAEnQRZCCTwMJKQnvP2mSQPcKNwtoAaMdXmQt_H+CGro=zVLsNA@mail.gmail.com>
 <1563374027.2676.18.camel@pengutronix.de>
 <CAEnQRZB96Q4stM4JsJskMhdH-7ktbc-QxPeibNOLHEXghtS-1w@mail.gmail.com>
Message-ID: <ee809845f1a5fd5af3f73b35eaa79314@akkea.ca>
X-Sender: angus@akkea.ca
User-Agent: Roundcube Webmail/1.3.6
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patchwork-lst@pengutronix.de, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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

On 2019-07-17 09:06, Daniel Baluta wrote:
> On Wed, Jul 17, 2019 at 5:33 PM Lucas Stach <l.stach@pengutronix.de> 
> wrote:
>> 
>> Hi Daniel,
>> 
>> Am Mittwoch, den 17.07.2019, 17:16 +0300 schrieb Daniel Baluta:
>> > > On Wed, Jul 17, 2019 at 1:59 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>> > >
>> > > The SAI block on the i.MX8M moved the register layout, as 2 version
>> > > registers were added at the start of the register map. We deal with
>> > > this by moving the start of the regmap, so both register layouts
>> > > look the same to accesses going through the regmap.
>> > >
>> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> >
>> > This is a little bit tricky. We need the verid register in order
>> > to differentiate IPs which can support 1:1 ratio for bclk:mclk
>> 
>> And this patch doesn't prevent this usage. If needed we can just read
>> the verid via a plain readl on the base mapping in the probe function
>> and cache it in struct fsl_sai. This seems way less intrusive than
>> carrying a register offset through all of the regmap accessors and
>> validation functions. I simply haven't implemented it in this patch, 
>> as
>> I had no need for it right now.
> 
> I must admit this is a very clever idea! Anyhow, I'm having some 
> concerns
> because unfortunately not all registers were shifted by 8 bytes.
> 
> See: imx6sx [1] (page 3575)  and imx8X [2] (page 5512) RMs.
> 
> We have something like this:
> 
> i.mx6 SX:
> 
> 00: TCSR
> 04: TCR1
> 08: TCR2
> 0C: TCR3
> ....
> 60: TMR
> 80: RCSR
> 
> i.mx 8X
> 
> 00: VERID
> 04: PARAM
> 08: TCSR
> 0C: TCR1
> ...
> 60: TMR
> 88: RCSR
> 

We could split it into an upper and a lower regmap. Only the lower would 
need the version register offset.

> [1]
> https://cache.nxp.com/secured/assets/documents/en/reference-manual/IMX6SXRM.pdf?__gda__=1563382650_d60ad6189b2431a35a0757ffc87cfb3f&fileExt=.pdf
> [2] https://www.nxp.com/docs/en/reference-manual/IMX8DQXPRM.pdf
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
