Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A58327983F
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Sep 2020 12:13:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67261A00;
	Sat, 26 Sep 2020 12:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67261A00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601115230;
	bh=zBGm5cdvHKQppiOACyEr/dEkmySiT8tWkWx19l4nAoc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nh6dvesb6gkG9N9ZHNGU1oHHTu+PflleIVFVVfqruGBYnTGgM7zVH+3+NB7e7qfaY
	 4rvsG/3k5WrahSWtU/OYxW6Kn9lFAc4Lm4lJDu5hOwZFNq9sjmgx7GxCdlOaMRyFC5
	 HBjUbTFJ9ydSV95I6vZitJb2qSA5DVLmFAARF41o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E5DF800FD;
	Sat, 26 Sep 2020 12:12:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1EADF80232; Sat, 26 Sep 2020 12:12:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H5,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 983F1F8010E
 for <alsa-devel@alsa-project.org>; Sat, 26 Sep 2020 12:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 983F1F8010E
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-64-PSRh-TBCNJOepc9cDIXbnQ-1; Sat, 26 Sep 2020 11:12:00 +0100
X-MC-Unique: PSRh-TBCNJOepc9cDIXbnQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sat, 26 Sep 2020 11:11:59 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Sat, 26 Sep 2020 11:11:59 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Coiby Xu' <coiby.xu@gmail.com>
Subject: RE: [PATCH 3/3] [PATCH] staging: greybus: __u8 is sufficient for
 snd_ctl_elem_type_t and snd_ctl_elem_iface_t
Thread-Topic: [PATCH 3/3] [PATCH] staging: greybus: __u8 is sufficient for
 snd_ctl_elem_type_t and snd_ctl_elem_iface_t
Thread-Index: AQHWklx17fnZOC5vd0GG3zjgQ4eUS6l3nRcQgAG47oCAAV+6oA==
Date: Sat, 26 Sep 2020 10:11:59 +0000
Message-ID: <cd09e7c7abaa4700bf9a0245d5844c44@AcuMS.aculab.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
 <0175c477851243baa8a92177667d6312@AcuMS.aculab.com>
 <20200925141125.vfm5sjnsfvxo2ras@Rk>
In-Reply-To: <20200925141125.vfm5sjnsfvxo2ras@Rk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Johan Hovold <johan@kernel.org>, Mark Greer <mgreer@animalcreek.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
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

From: Coiby Xu
> Sent: 25 September 2020 15:11
>=20
> On Thu, Sep 24, 2020 at 10:54:50AM +0000, David Laight wrote:
> >From: Coiby Xu
> >> Sent: 24 September 2020 11:21
> >> Use __8 to replace int and remove the unnecessary __bitwise type attri=
bute.
> >>
> >> Found by sparse,
> >...
> >> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> >> index 535a7229e1d9..8e71a95644ab 100644
> >> --- a/include/uapi/sound/asound.h
> >> +++ b/include/uapi/sound/asound.h
> >> @@ -950,7 +950,7 @@ struct snd_ctl_card_info {
> >>  =09unsigned char components[128];=09/* card components / fine identif=
ication, delimited with one
> >> space (AC97 etc..) */
> >>  };
> >>
> >> -typedef int __bitwise snd_ctl_elem_type_t;
> >> +typedef __u8 snd_ctl_elem_type_t;
> >>  #define=09SNDRV_CTL_ELEM_TYPE_NONE=09((__force snd_ctl_elem_type_t) 0=
) /* invalid */
> >>  #define=09SNDRV_CTL_ELEM_TYPE_BOOLEAN=09((__force snd_ctl_elem_type_t=
) 1) /* boolean type */
> >>  #define=09SNDRV_CTL_ELEM_TYPE_INTEGER=09((__force snd_ctl_elem_type_t=
) 2) /* integer type */
> >
> >WTF is all that about anyway??
> >What is wrong with:
> >#define=09SNDRV_CTL_ELEM_TYPE_NONE=090u /* invalid */
>=20
> I'm sorry I don't quite understand you. Are you suggesting SNDRV_CTL_ELEM=
_TYPE_NONE
> isn't needed in the first place?

No, just remove all the casts from the constants.
Are the types even used anywhere else?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

