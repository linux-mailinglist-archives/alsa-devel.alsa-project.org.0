Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8982A359220
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 04:46:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030241616;
	Fri,  9 Apr 2021 04:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030241616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617936395;
	bh=T1Eq/iDUmu9D0cLMW5oY9Y4bVyX7j1CAIJWJ+omQLlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LI7vSt9N/LckmNOG4/cgEOD5efmOBQHfSO6RDNTdxQAJnfqS2axEzohq51yOx4ZZ+
	 qpr4CNoGRLjWVuZr+fdSG1uKfXd7AoDCpB1VSX4GsEGWKuhQtcqGo88MOHQkSisDqm
	 QpxOJ7bGSz7vqx8QQ7ZcICzq0lOO0/i+5wZ0kF40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E37AF8016D;
	Fri,  9 Apr 2021 04:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AD74F8016A; Fri,  9 Apr 2021 04:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07FB6F80162
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 04:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07FB6F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SOUOtbGF"
Received: by mail-qk1-x72a.google.com with SMTP id x11so4466044qkp.11
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 19:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vMrzWKogHlzbZ9TCkwVyoU4G2noT/Gn934XqBUoobqI=;
 b=SOUOtbGFuKmxB4UUkaK+v9gigriYjFSpzPy1BejyHm4cAhwiwDUo7VOdYCSfMgBAky
 EHh2tcGda6H7PVzYwNWd2uULdkuKXfDiHKv6wmkpHtJp5UvUhWFfLHmAtz1+UN+4hBJt
 +lIFlfY4oqacA8fnoPrZzfu3gkmYNqofurs5Exb8GFH60SOyKNK4ticJvsxYJF9aM2Pi
 V8xwSwuILyQ/aCD+nf7v6WIUb68JYBvhk1qMUx+cqj+MCanoNFct9qrUJ2c3Y0I8QS2b
 D7JAA2gEJugV62B29DoJqM05tXt7T2wmrlra4XXNXS4DtNIv++PoBT7X4MTnztoI4G8M
 somA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vMrzWKogHlzbZ9TCkwVyoU4G2noT/Gn934XqBUoobqI=;
 b=oF/zaH3ozfCswiEmwktaV6xmc/LcfBRFoEhDbB5SwtBW17TZxLgnwshfb4grc2rQlf
 xtVmfJXPe3wVll78YfCVt/xY9C5Cso8pRYeNA1GaxAor7kPLoLbV3huKiCViHq5zMf44
 KGEm7KyOuBWd4jc2qFzXiBsWWq+6O+PbxUpuBX7dbzy8uCynDG2V09zp7v15vTClvT8A
 LdkwjFdwvVQaUC/JMm7mirRn4FBWxo+GRk0cPIJl/lc/DP6ECulXFn4o7MqkhoMwXu6S
 CznaD6RhLs80Wd8qxIHef8ooGaE3m6ISoRImTx5YgRUf0GjgiumCR4g0cjsJxf4QlSUi
 7Yxw==
X-Gm-Message-State: AOAM533LdTV/it4F5byElwnbpJe77nTC9CmRqKO47Rodv6N0E3Y0WqXX
 Ke2TYh5pElC53NuJJ40Y0kF0xzQ+efA3mtpDdrQ=
X-Google-Smtp-Source: ABdhPJwPNEigcJSUfpxRUg7CyyUnqWMDd6lCCYrtNMm7j4VJlBWYa4WXCV41UUzlbTHsTRPM1ayeVRKkyxCIrumpkmI=
X-Received: by 2002:ae9:f444:: with SMTP id z4mr11777947qkl.226.1617936295390; 
 Thu, 08 Apr 2021 19:44:55 -0700 (PDT)
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
In-Reply-To: <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 8 Apr 2021 23:40:42 -0300
Message-ID: <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Hi Lucas, try the following patch to disable the hold on the URBs for the
Roland D-05 for example.

--- endpoint.git.c      2021-04-08 23:35:55.786731210 -0300
+++ endpoint.c  2021-04-08 23:34:17.783404159 -0300
@@ -1343,6 +1343,7 @@ int snd_usb_endpoint_start(struct snd_us
 {
        int err;
        unsigned int i;
+       bool skip_implicit_fb_urb_hold;

        if (atomic_read(&ep->chip->shutdown))
                return -EBADFD;
@@ -1375,7 +1376,13 @@ int snd_usb_endpoint_start(struct snd_us
        if (!ep_state_update(ep, EP_STATE_STOPPED, EP_STATE_RUNNING))
                goto __error;

-       if (snd_usb_endpoint_implicit_feedback_sink(ep)) {
+        skip_implicit_fb_urb_hold = false;
+
+        if (USB_ID_VENDOR(ep->chip->usb_id) == 0x0582 &&
+           USB_ID_PRODUCT(ep->chip->usb_id) == 0x01ff)
+               skip_implicit_fb_urb_hold = true;
+
+       if (snd_usb_endpoint_implicit_feedback_sink(ep) &&
!skip_implicit_fb_urb_hold) {
                for (i = 0; i < ep->nurbs; i++) {
                        struct snd_urb_ctx *ctx = ep->urb + i;
                        list_add_tail(&ctx->ready_list,
&ep->ready_playback_urbs);

On Thu, Apr 8, 2021 at 10:54 PM Lucas <jaffa225man@gmail.com> wrote:

> Sorry, this is a question that has nothing to do with your last, but I
> previously tried creating a patch for endpoint.c that tests based on
> USB_ID_VENDOR(chip->usb_id), and USB_ID_PRODUCT(chip->usb_id) but they
> aren't recognised there.  Do you know what I might be able to use there to
> avoid messing with every other snd_usb_audio device?  Sorry, I just haven't
> looked the code over long enough.
>
> I may just try your quick recompilation method, as I realized it shouldn't
> create any new files the package manager couldn't eventually remove through
> the usual "apt-get remove linux-image-5.11.9".  Although, I'll probably be
> rebooting anyway, since the last time I tried to "modprobe -r
> snd_usb_audio" it refused due to dependencies.
>
>   Thanks!
>
