Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D0C35B6F7
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Apr 2021 23:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D91591658;
	Sun, 11 Apr 2021 23:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D91591658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618175608;
	bh=TDGqOvzHVJOupu+c/aSWMRZBrZp1DGn3kjMn8sxXooc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gd4AXAaqtf9MNqzrQAZ3cxpWojT4xGIXXs1CxdCuJ0cffg+YNXEdw7LDzuX+z8A6u
	 4QtB9XZ+xXuITGgr24HdtbeL21cb6KD1ISHZ10C11smwqmbWMkCUIGiNv7O/sn70XW
	 hh+wxhybdaYtJRLa6CYIbM0bhkNfFmWQk1KVJXJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39C49F8022D;
	Sun, 11 Apr 2021 23:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3737F8022B; Sun, 11 Apr 2021 23:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ACE0F800EE
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 23:11:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACE0F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h2XXvzw0"
Received: by mail-ej1-x62d.google.com with SMTP id n2so16940367ejy.7
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 14:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZPB7WNr+1tr+Cll0U0Yxz6mBg+OsF+B/XIrxX6wSpE=;
 b=h2XXvzw0/oanWenu1G04Qok/NRe4vjxQQZgYB7dqKFAg9ao73U2q0VPRoxghbL8mC5
 pQkMFgUHJMjeb0kwf8YmwVnmnTs1ggi6rkTHtk9frZ7MvML2BYH47SdPEhdDaZRyEtrx
 uCyIkzfarAj75U7C4/yzPuXvjuzfVITALTiqhbtgxbRGCNVoJxDnNZ8sm4hsLoaIycO/
 fhxj+BtmmAuJ3CQahIkXaQ2xVxNSde+FrxrmnPcx3xBcPpglPfr3xo76FNyjm5uGEYlI
 p8JcAgmURxQ3X6AOMm91SahK0X4F/+MqsfyVXIi7aDvsIbu1HG9wlrlTs/KK8yZc76Qn
 g6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZPB7WNr+1tr+Cll0U0Yxz6mBg+OsF+B/XIrxX6wSpE=;
 b=ljXAkLSqV10SQ0Qds7V06vvYkYRC8H/qBBjwKHjepKSeBZpfGj8bm2oEyEmftrj0CF
 oEXP1cPn3eHTAvLrzbXSAByBFwzmrOvAzFzyEzUVhCI3Td2DDD+xu9Ba0wEA7CPmizYg
 Kp0kW+xxEK42TRGFkaXhq3ZqpOFv84MhO2doVhhnIu3ydqizwkG2qm+mZUT8tKq2zq74
 kDpPWrw/O4Ap9qF03AE89tvyNBSxfUFa8P+agoCpkMN9S5w2Gin5M9tWzvW5w7Jejfbp
 GSP9WyFv1aONWuunnA2bngbpP2IwMZuuLIxyw0jpEiqyCjKJspTmgMMMzyPPOXt/pnqO
 juyw==
X-Gm-Message-State: AOAM530/GMZRJR9B5W+BGGn+Wgvxlb8yVxKR1H7SloLNIj8oABYcNqXU
 AqNMioOSLh66EASrMwzTJDr67juNN3dTt65yhNM=
X-Google-Smtp-Source: ABdhPJwZ9eSsLgZ2Lcd+Xp1wmvyf2Dy7om6BGNW5fPfnqDhHqGKBlK1lxQfmns3w8GgXCmR9DcOUQwu+/7ln5YGwVeM=
X-Received: by 2002:a17:907:9691:: with SMTP id
 hd17mr1418262ejc.205.1618175504965; 
 Sun, 11 Apr 2021 14:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
 <CAEsQvcs8HasvcJm0oEr87gNPxB6o2Km_NtAojTq+VkEX9EZd0g@mail.gmail.com>
 <CAHXb3bcMRrtMtfoHOCikNAkXxemnScfTPvJ702N_z6o5xj-G5g@mail.gmail.com>
 <CAEsQvcuo0g9STXn1d-Wux0TOH32mc88=Lw44r0ng+QocztcG3Q@mail.gmail.com>
 <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
 <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
 <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
 <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
 <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
 <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
 <CAOsVg8r85TsJypOSm5ZRv49uv+v=MZyNONe32AgGZL0fbYNayw@mail.gmail.com>
 <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
 <CAHXb3bcAR9RxwUJ+T9sMX4UdS3tXLZV-kWwHbbawW0ANUx2cGw@mail.gmail.com>
In-Reply-To: <CAHXb3bcAR9RxwUJ+T9sMX4UdS3tXLZV-kWwHbbawW0ANUx2cGw@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Sun, 11 Apr 2021 16:11:33 -0500
Message-ID: <CAOsVg8ok+-cNo9bF9Zg=hKHg-DUKjvvO5ipur57HLfgggs5BQw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Geraldo Nascimento <geraldogabriel@gmail.com>
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

Okay, thanks Mike, and I'm glad it might help!  Is there a link to the flag
patch anywhere, as I haven't found it yet?  I also realized that I have a
third EDIROL device (the UA-25EX), and will test it ASAP.

On Sun, Apr 11, 2021 at 2:46 PM Mike Oliphant <oliphant@nostatic.org> wrote:

> Hi Lucas - it is very useful to have the results from those other
> interfaces. Takashi has been working on a patch that handles my endpoint
> fix using a flag set during endpoint configuration. Right now it is only
> enabled for the BOSS devices, but It will be very easy for you to add your
> extra working Roland devices.
>
> Mike
>
