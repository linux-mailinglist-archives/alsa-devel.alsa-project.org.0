Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C59ACA1D87
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B552169B;
	Thu, 29 Aug 2019 16:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B552169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089974;
	bh=frWijzy9Sc0AuFD4mV95tIa0tlG/YVEfhWPQRdUbG7k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lnUMDAMDSdsPorlzPQ8zB/0Z+EVY8VIqAneJdWZ1eNJ+zKjXP7lAjGdcpE9rJhWWc
	 MzKAwkYG49T3o7qBN1oYhujv83IHE8tTD7UH1tplP/oKW0+KqzTjf/pDI6SalvzBxl
	 on5RthTBnEcsP4vSnCBu/2hSTTB/BywK7hxf7KB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F391AF80CC2;
	Wed, 28 Aug 2019 00:37:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68BA8F80CC0; Wed, 28 Aug 2019 00:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A71F8F80C0F
 for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2019 00:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71F8F80C0F
Received: by mail-ot1-f67.google.com with SMTP id m24so764378otp.12
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 15:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=zauk4U8OoEi1FBo/2vpUOZ45fQEWaY7iuSdGeCHe83s=;
 b=hep+2DeLupDuNag4I7NF0ulww4FMT6408FCCzXFhybxkG/jgZ5zYhEva5nnZvRjxUh
 bS47gJeFZDcxHlVZt0HzfGd7zWKn6XG5raCKrZP0dMs1C1+sMHrP7qR3Gr0HHWeOq4qA
 hVAqwRYVZTFhVyebmxl6peCCWOPDgOx8zvxNv1bC1yoza3P50guD91w99BxCKiTvNBKb
 W0ZFiBm14rRe2UILFXXEB4Au1FzQ7jA8EjclWe3uichZIdaasAcptStwd3TexWrOlhm7
 FsvUVIV0R5YeBT+BLdYPYoECYPjVJfEIQtPsGUd5W62vRroDJ5yrUAZaKQqAQX8lX5LX
 taHQ==
X-Gm-Message-State: APjAAAXzOWCq3KujYXxW2ErK/jH2rIhO554Lv5S9zFQa3ccLZbu8rFTX
 GV0GWijxM0qA9ubEfFtAMQ==
X-Google-Smtp-Source: APXvYqwyWCyxbtq92eeNM9609mAefZjtCS/Vde8B3KkemlEEUxzPpD1Evn5Zu509yiJdHmGHVTcsHg==
X-Received: by 2002:a05:6830:1345:: with SMTP id
 r5mr848280otq.158.1566945437274; 
 Tue, 27 Aug 2019 15:37:17 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q85sm200903oic.52.2019.08.27.15.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 15:37:16 -0700 (PDT)
Date: Tue, 27 Aug 2019 17:37:16 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Message-ID: <20190827223716.GA31605@bogus>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <9b85d5a7c7e788e9ed87d020323ad9292e3aeab7.1566677788.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b85d5a7c7e788e9ed87d020323ad9292e3aeab7.1566677788.git.mirq-linux@rere.qmqm.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Chas Williams <3chas3@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 4/6] dt-bindings: misc: atmel-ssc: LRCLK
 from TF/RF pin option
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gU2F0LCBBdWcgMjQsIDIwMTkgYXQgMTA6MjY6NTVQTSArMDIwMCwgTWljaGHFgiBNaXJvc8WC
YXcgd3JvdGU6Cj4gQWRkIHNpbmdsZS1waW4gTFJDTEsgc291cmNlIG9wdGlvbnMgZm9yIEF0bWVs
IFNTQyBtb2R1bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEt
bGludXhAcmVyZS5xbXFtLnBsPgo+IAo+IC0tLQo+ICAgdjI6IHNwbGl0IGZyb20gaW1wbGVtZW50
YXRpb24gcGF0Y2gKPiAKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21pc2MvYXRtZWwtc3NjLnR4dCB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWlzYy9hdG1lbC1zc2MudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21pc2MvYXRtZWwtc3NjLnR4dAo+IGluZGV4IGY5ZmI0MTI2NDJmZS4uYzk4ZTk2ZGJlYzNhIDEw
MDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL2F0bWVs
LXNzYy50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9h
dG1lbC1zc2MudHh0Cj4gQEAgLTI0LDYgKzI0LDExIEBAIE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4g
ICAgICAgICB0aGlzIHBhcmFtZXRlciB0byBjaG9vc2Ugd2hlcmUgdGhlIGNsb2NrIGZyb20uCj4g
ICAgICAgLSBCeSBkZWZhdWx0IHRoZSBjbG9jayBpcyBmcm9tIFRLIHBpbiwgaWYgdGhlIGNsb2Nr
IGZyb20gUksgcGluLCB0aGlzCj4gICAgICAgICBwcm9wZXJ0eSBpcyBuZWVkZWQuCj4gKyAgLSBh
dG1lbCxscmNsay1mcm9tLXRmLXBpbjogYm9vbCBwcm9wZXJ0eS4KPiArICAtIGF0bWVsLGxyY2xr
LWZyb20tcmYtcGluOiBib29sIHByb3BlcnR5Lgo+ICsgICAgIC0gU1NDIGluIHNsYXZlIG1vZGUg
Z2V0cyBMUkNMSyBmcm9tIFJGIGZvciByZWNlaXZlIGFuZCBURiBmb3IgdHJhbnNtaXQKPiArICAg
ICAgIGRhdGEgZGlyZWN0aW9uLiBUaGlzIHByb3BlcnR5IG1ha2VzIGJvdGggdXNlIHNpbmdsZSBU
RiAob3IgUkYpIHBpbgo+ICsgICAgICAgYXMgTFJDTEsuIEF0IG1vc3Qgb25lIGNhbiBiZSBwcmVz
ZW50LgoKQSBzaW5nbGUgcHJvcGVydHkgdGFraW5nIDEgb2YgcG9zc2libGUgMiB2YWx1ZXMgd291
bGQgcHJldmVudCB0aGUgZXJyb3IgCm9mIG1vcmUgdGhhbiAxIHByb3BlcnR5IHByZXNlbnQuCgo+
ICAgIC0gI3NvdW5kLWRhaS1jZWxsczogU2hvdWxkIGNvbnRhaW4gPDA+Lgo+ICAgICAgIC0gVGhp
cyBwcm9wZXJ0eSBtYWtlcyB0aGUgU1NDIGludG8gYW4gYXV0b21hdGljYWxseSByZWdpc3RlcmVk
IERBSS4KPiAgCj4gLS0gCj4gMi4yMC4xCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2Fsc2EtZGV2ZWwK
