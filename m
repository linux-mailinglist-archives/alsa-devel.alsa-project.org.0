Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17472308974
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 15:11:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7428E16A4;
	Fri, 29 Jan 2021 15:10:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7428E16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611929460;
	bh=jqf5NP6+C8qJ1zuKJEY+vN4WF0Up1r+QO+6Mwei4RH8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2QlO9JdJTzdddarFqdZqNWNZOi4/nH6K6CLA0E3msfccMH44tSYhuJ+0Cl9ur/EB
	 hZaMnNgSqajJwq248z16VL+6yiw8fJYOyuB206UjW92d9GFlxfY6W5BoL48Yjg2WFh
	 aPlan/Nqei/eXqeln96QbjMpKggEuVMHy+9+rpwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9340F8025F;
	Fri, 29 Jan 2021 15:09:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6510F800EB; Fri, 29 Jan 2021 15:09:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 867F6F800EB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 15:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 867F6F800EB
Received: from artex.localnet ([109.250.135.230]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVvCn-1lVA5i39QD-00RpwH; Fri, 29 Jan 2021 15:09:11 +0100
From: Fabian Lesniak <fabian@lesniak-it.de>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Olivia Mackintosh <livvy@base.nu>
Subject: Re: [PATCH] ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
Date: Fri, 29 Jan 2021 15:09:11 +0100
Message-ID: <3031135.XsSY7s2paC@artex>
In-Reply-To: <20210128160338.dac4vrj7wjiykcxm@base.nu>
References: <20210128160338.dac4vrj7wjiykcxm@base.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Provags-ID: V03:K1:YYvVnsgfRLKq7XDM62myh7fEkGtIPmVR+TABatSQSAb7ulqNqJ2
 9SRg6t0Zxo8iUH5XWQLW2hIPoOS0yj2cnlqv4kazLoeg9Te/cB/uHNJrOq01GpNOND/Y+SM
 FovkY4ptPBsPqLdqKECvgsmwyJ82cyNrJuD5TOkiidZvKxN7QMxKuyVJkZUg7SiS6I6RgmY
 kquBeWUZQ3ke2Hfwn189A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bp7o8bYOGZE=:K3Biv2i1E6nP6ZrJS/Z0CS
 oMB6tP1rrN7lhJ9v99tH66L4AIByxZgpWOHhs6FqTmEn0q89eQOpMYetYTJKfYfby76qHenie
 AQu3cLWKVQeVWWs1uDNzu0WGiWYYxRm6E4e5gGFq1JkFr4EcVmi2pzYCYf4gtrzdFRnegWMaV
 AuOmTiJnqZFIyFDFEpO0XG9nNZpUcoRlx3/WHGqQ36ykDSmWeukZjQmarixiwJQ9ou4n5IRBG
 aGkYjghxCe0BFpWB8xyjkhOZkyciZVlFup7/ncNNjFQ1/Lnh3met+/us+HdKBOLmKzg/rHpQ/
 +6pLe68XLwhIdYoNyVlNQHBpZ8+k/3EpUFaJQxVFbTqrZW/TfLcrCmRR+rRcMKMJ8d9oTknBP
 NPrUOmFCfmrBZnhnSELzDqPEZM7vB6IkmYjHi+Dklgj/VQhoSV0QTxTMf3xlqgW2GnaA33QCt
 lAjxS3U75g==
Cc: =?utf-8?B?RnJhbnRp77+977+9ZWsgS3Xvv73vv71lcmE=?= <franta-linux@frantovo.cz>
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

Hi Olivia,

perfect time for this patch since I'm currently working on similar quirks for
the DJM-900NXS2 model. I will stick to your method for now. I do have some
minor comments below.

In general, I'm wondering whether it is a good way to implement more and more
Pioneer devices in such a hard coded way. mixer_quirks.c already has >3k LOC,
and the 900NXS2 support will add at least 100 more if written in the same
scheme. It may be good to either dynamically create controls depending on the
model or move pioneer support to an extra file. I'd like to hear what Takashi
thinks about that.

Cheers
Fabian

> +static const struct snd_pioneer_djm_device snd_pioneer_djm_devices[] = {
> +	{ .name = "DJM-250Mk2", .controls = snd_pioneer_djm250mk2_option_groups, .ncontrols = 7},
> +	{ .name = "DJM-750", .controls = snd_pioneer_djm750_option_groups, .ncontrols = 5}
> +};
These fixed values for ncontrols can easily be overlooked, consider ARRAY_SIZE
instead. Maybe introduce a macro similar to snd_pioneer_djm_option_group_item.

> +	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
This makes a local copy, which can be avoided by using a pointer instead:
const struct snd_pioneer_djm_device *device = &snd_pioneer_djm_devices[device_idx];

> usb_mixer_interface *mixer, u1 err = snd_usb_ctl_msg(
>  		mixer->chip->dev, usb_sndctrlpipe(mixer->chip->dev, 0),
>  		USB_REQ_SET_FEATURE,
> -		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> -		snd_pioneer_djm_option_groups[group].options[value].wValue,
> -		snd_pioneer_djm_option_groups[group].options[value].wIndex,
> +		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> device.controls[group].options[value].wValue,
> +		device.controls[group].options[value].wIndex,
>  		NULL, 0);
Rather keep these arguments aligned.

> -		err = snd_pioneer_djm_controls_create(mixer);
> +		err = snd_pioneer_djm_controls_create(mixer, 0x00);
> +		break;
> +	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
> +		err = snd_pioneer_djm_controls_create(mixer, 0x01);
>  		break;
I'd introduce defines for the different models instead of raw values.


