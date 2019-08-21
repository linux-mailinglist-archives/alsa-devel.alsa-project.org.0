Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D2897ACF
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 15:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17957165F;
	Wed, 21 Aug 2019 15:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17957165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566394328;
	bh=QdyjgTgR1xxt549waGQFZtZ53ayNTVpeoRk3amC6A2E=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mFJPTckpRrls6Q27GlUwQ0e46u6/x7f3rIKZk3xgMSs3HkA2cYLK6u/oAmMOIRnMc
	 LAuJgXSHCqI348srgacM5O0pF3NjeRBPyCx6p2Fj8r4fA4rCoGjwhS7EEMIHvuRPZQ
	 J4aOuxf7D9MKxVffogWB59o8uRtVImW2pTPpNZRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3104F80322;
	Wed, 21 Aug 2019 15:30:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3985BF80306; Wed, 21 Aug 2019 15:30:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B353FF80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 15:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B353FF80157
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 06:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="178503187"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
 by fmsmga008.fm.intel.com with ESMTP; 21 Aug 2019 06:30:08 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.7]) by
 irsmsx105.ger.corp.intel.com ([169.254.7.73]) with mapi id 14.03.0439.000;
 Wed, 21 Aug 2019 14:30:03 +0100
From: "Uimonen, Jaska" <jaska.uimonen@intel.com>
To: Mark Brown <broonie@kernel.org>, Jaska Uimonen
 <jaska.uimonen@linux.intel.com>
Thread-Topic: [PATCH] ASoC: SOF: topology: fix get control data return type
 and arguments
Thread-Index: AQHVWB30upgk6q+QJEmV/bYE5Z4jEqcFf6kAgAAYKTA=
Date: Wed, 21 Aug 2019 13:30:02 +0000
Message-ID: <E2FAA01B96908D4ABFB182B6E1AD75D6A1FC15F7@IRSMSX102.ger.corp.intel.com>
References: <20190821123252.30920-1-jaska.uimonen@linux.intel.com>
 <20190821125956.GJ5128@sirena.co.uk>
In-Reply-To: <20190821125956.GJ5128@sirena.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: topology: fix get control data
 return type and arguments
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Wednesday, August 21, 2019 4:00 PM
> To: Jaska Uimonen <jaska.uimonen@linux.intel.com>
> Cc: alsa-devel@alsa-project.org; Uimonen, Jaska <jaska.uimonen@intel.com>
> Subject: Re: [PATCH] ASoC: SOF: topology: fix get control data return type and
> arguments
> 
> On Wed, Aug 21, 2019 at 03:32:52PM +0300, Jaska Uimonen wrote:
> 
> > +static int sof_get_control_data(struct snd_sof_dev *sdev,
> > +				struct snd_soc_dapm_widget *widget,
> > +				struct sof_widget_data *wdata,
> > +				size_t *size)
> >  {
> >  	const struct snd_kcontrol_new *kc;
> >  	struct soc_mixer_control *sm;
> >  	struct soc_bytes_ext *sbe;
> >  	struct soc_enum *se;
> > -	size_t size = 0;
> >  	int i;
> 
> 
> > -		size += wdata[i].pdata->size;
> > +		/* don't accept 0 size for data */
> > +		if (!wdata[i].pdata->size)
> > +			return -EINVAL;
> 
> This should really be a separate change.
[Uimonen, Jaska] 
Ok will remove from this patch.
> 
> > +
> > +		*size += wdata[i].pdata->size;
> 
> We appear to be requiring that the size passed in is zero initialized
> which is a bit unusual and seems likely to break even if it happens to
> work right now.
[Uimonen, Jaska] 
Same comments I got from Pierre, obviously I'm not very good listener.
Will initialize size to 0.
---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
