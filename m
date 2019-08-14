Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058C08CF17
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 11:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97DB6165E;
	Wed, 14 Aug 2019 11:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97DB6165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565773895;
	bh=G3b9RJ99jt6UaNoJqO1m9czl+fZvBENhb9CxMbBz4ms=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OQVk/nRYb1Zl1O2O+MAfXri8+4JJc4QjMq3hKAuHxfmWo+8S/qYhwt5k6m97/mRVT
	 0UjtFUgrTEb51k5yX95ZxFpzJKff2WmWbQ+d5JVw+P4+3YUyBsKndN5Mo0kvZIZNM7
	 DBubnMezY4Yd8bi7cQTCTDhtDO7FIfBnmQXZVGJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F39A8F8048D;
	Wed, 14 Aug 2019 11:09:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 606D6F8048D; Wed, 14 Aug 2019 11:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C416F803F4
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 11:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C416F803F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="WEU3oqFI"
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7E98gBC051496;
 Wed, 14 Aug 2019 09:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=TNfNRRKJgbXv7UuZJo39ZwJD8vTIpc3kkLpNrGx/jZc=;
 b=WEU3oqFIDbauuFkn2Z4Zj55MKAreETQepZfadI63N7c9H3nRG0VLn3V2QLmS1n7IHDJy
 pvpKgtbZoiksHZMQYZd/7bAnei/VAlo0Jg93kM6DCL02zEwMXuOqpWd1Y/V1GU55Zf5L
 dwmaLqe7VHj4eY7Jdzy5lK8SYC8g/QM5XK7iR7Ui+rzSZK3iIygOSztXg865qQU1qzzm
 +PgsJLQZ9FDLMpXt6rAgR6f58/wWoFV9djD0P/jQ5jL6HcarZQP5660pbXaxWZM+ANfa
 lRxR2pVC822YT/YvjO5s0ssqv9AgmUYqdpkZ1j3psY4oYy4tVwf3OYQdId1Dwo78ZW+6 Gw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2u9nvpbptr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 09:09:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7E97toh101805;
 Wed, 14 Aug 2019 09:09:42 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2ubwrh1xmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 09:09:42 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x7E99U1i025522;
 Wed, 14 Aug 2019 09:09:31 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 14 Aug 2019 02:09:30 -0700
Date: Wed, 14 Aug 2019 12:09:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190814090921.GO1935@kadam>
References: <20190814023625.21683-1-benquike@gmail.com>
 <s5hzhkcb6dh.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hzhkcb6dh.wl-tiwai@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908140092
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9348
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908140092
Cc: Mathias Payer <mathias.payer@nebelwelt.net>, security@kernel.org,
 Wenwen Wang <wang6495@umn.edu>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 alsa-devel@alsa-project.org, Thomas Gleixner <tglx@linutronix.de>,
 Hui Peng <benquike@gmail.com>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] Fix an OOB bug in parse_audio_mixer_unit
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

On Wed, Aug 14, 2019 at 08:36:42AM +0200, Takashi Iwai wrote:
> On Wed, 14 Aug 2019 04:36:24 +0200,
> Hui Peng wrote:
> > 
> > The `uac_mixer_unit_descriptor` shown as below is read from the
> > device side. In `parse_audio_mixer_unit`, `baSourceID` field is
> > accessed from index 0 to `bNrInPins` - 1, the current implementation
> > assumes that descriptor is always valid (the length  of descriptor
> > is no shorter than 5 + `bNrInPins`). If a descriptor read from
> > the device side is invalid, it may trigger out-of-bound memory
> > access.
> > 
> > ```
> > struct uac_mixer_unit_descriptor {
> > 	__u8 bLength;
> > 	__u8 bDescriptorType;
> > 	__u8 bDescriptorSubtype;
> > 	__u8 bUnitID;
> > 	__u8 bNrInPins;
> > 	__u8 baSourceID[];
> > }
> > ```
> > 
> > This patch fixes the bug by add a sanity check on the length of
> > the descriptor.
> > 
> > Signed-off-by: Hui Peng <benquike@gmail.com>
> > Reported-by: Hui Peng <benquike@gmail.com>
> > Reported-by: Mathias Payer <mathias.payer@nebelwelt.net>
> > ---
> >  sound/usb/mixer.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index 7498b5191b68..38202ce67237 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -2091,6 +2091,15 @@ static int parse_audio_mixer_unit(struct mixer_build *state, int unitid,
> >  	struct usb_audio_term iterm;
> >  	int input_pins, num_ins, num_outs;
> >  	int pin, ich, err;
> > +	int desc_len = (int) ((unsigned long) state->buffer +
> > +			state->buflen - (unsigned long) raw_desc);
> > +
> > +	if (desc_len < sizeof(*desc) + desc->bNrInPins) {
> > +		usb_audio_err(state->chip,
> > +			      "descriptor %d too short\n",
> > +			      unitid);
> > +		return -EINVAL;
> > +	}
> >  
> >  	err = uac_mixer_unit_get_channels(state, desc);
> >  	if (err < 0) {
> 
> Hm, what is the desc->bLength value in the error case?
> 
> Basically the buffer boundary is already checked against bLength in
> snd_usb_find_desc() which is called from obtaining the raw_desc in the
> caller of this function (parse_audio_unit()).
> 
> So, if any, we need to check bLength for the possible overflow like
> below.
> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -744,6 +744,8 @@ static int uac_mixer_unit_get_channels(struct mixer_build *state,
>  		return -EINVAL;
>  	if (!desc->bNrInPins)
>  		return -EINVAL;
> +	if (desc->bLength < sizeof(*desc) + desc->bNrInPins)
> +		return -EINVAL;

VERSION 1 and 2 already have a different check:

	if (desc->bLength < sizeof(*desc) + desc->bNrInPins + 1)
		return 0; /* no bmControls -> skip */

So something is possibly off by one.  It's just version 3 which doesn't
have a check.

regards,
dan carpenter

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
