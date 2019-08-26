Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0A9D4AD
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 19:12:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18AAC16B8;
	Mon, 26 Aug 2019 19:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18AAC16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566839546;
	bh=d0XnK75QLOHrDyC/E3exlusdDd5yf2npHanERuARUTo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiQB8S1L9fLh0mMPcXj6gh4QZhhDcBi7UXPKfXzZoykhnvm1OxE2OTZuPSi3zw7nV
	 dL7gIjCIKDS00dfBPBwWzwlpdByOIILpWlgWbzLqwr2ugE2YY8siG+qmwQkYzbeyrD
	 8q2x7elqwgMEuMvBO6fhBB0r0ZN9zduA5vCIigd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2979F80377;
	Mon, 26 Aug 2019 19:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A0D5F80143; Mon, 26 Aug 2019 19:10:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.sonarnerd.net (rankki.sonarnerd.net [194.142.149.154])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CDF0F80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 19:10:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CDF0F80143
Received: from [IPv6:fc00::2] (porkkala.uworld [IPv6:fc00::2])
 by mail.sonarnerd.net (Postfix) with ESMTP id D10372310EC;
 Mon, 26 Aug 2019 20:10:33 +0300 (EEST)
To: ilya.pshonkin@netforce.ua
References: <20190826160953.19402-1-ilya.pshonkin@netforce.ua>
From: Jussi Laako <jussi@sonarnerd.net>
Message-ID: <021132df-8deb-b9f0-2d9e-e934f92c6c7a@sonarnerd.net>
Date: Mon, 26 Aug 2019 20:10:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826160953.19402-1-ilya.pshonkin@netforce.ua>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manuel Reinhardt <manuel.rhdt@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Richard Fontana <rfontana@redhat.com>,
 Sudokamikaze <sudokamikaze@protonmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Add Hiby R3 to quirks for
 native DSD support
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

> +	/* ESS Sabre based USB DACs */
> +	case USB_ID(0xc502, 0x0051): /* Hiby R3 */
> +		if (fp->altsetting == 4)
> +			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
> +		break;

Do you know who's vendor id is this? ESS Sabre is a DAC chip with I2S 
input, I'm not aware of any product from ESS under Sabre brand that 
would include USB interface. (?) So likely the USB interface is sourced 
from somewhere else...

It is good to check with "lsusb -vvv" if the device flags DSD altsetting 
as raw. Then you know it'll work with the auto-detection code and 
doesn't break so easily if firmware update changes altsettings (not 
uncommon to happen).


	- Jussi

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
