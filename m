Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2066C3EA816
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 17:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B39B1922;
	Thu, 12 Aug 2021 17:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B39B1922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628783734;
	bh=FX1rRv7pqSgLGleg5/MNoYbT3U3sZwfdfSbcGvIzW1o=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iCEBV/b60VIOUXwviOPc+9H7zkyPzgJXsmKcflPU5qK++UxD2E56u5Tfy14EL6COz
	 lbYtMgweGQoyouluHhvmSI6TFpXzfLPe27MMcflzOOeR0eFxaGwxQo1eHI1hHS0t/3
	 20l0e5o4JEOl6qUpnZs2WOiEuoQvgzRfeiKWYMAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8059F80279;
	Thu, 12 Aug 2021 17:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13A86F8025D; Thu, 12 Aug 2021 17:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from sender11-of-o52.zoho.eu (sender11-of-o52.zoho.eu
 [31.186.226.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB21F80148
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 17:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB21F80148
ARC-Seal: i=1; a=rsa-sha256; t=1628783632; cv=none; d=zohomail.eu; s=zohoarc; 
 b=Xj64sDJVoXGAykimUvRpC3EtXOkURq1n8hAHqYBcqaKtLIhmMtebfBTbvpoH6ac1D9FDOwaCuFTmslZ02j23E5k48EOSikrh9U5zjZBHMtL+MkzNr45GVCCil42TM5PjKPpltlWP3GhTnk+P+ULIBrs2ng1kImAdDM2myo88Ayw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1628783632;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=QNykV9Fc66Oo3LQ0uiSSO3Q3uGX2Jsb7RLwuojfsZc4=; 
 b=hF4YlzqFaRVyaMzuKp7s7LTpBkrUWEr/y73a+305TIz4+LA0l7UN387SJJx9/B6C7BX8AelrCz8atcoWzdyg+OSkcqx88qd5rikuGAvjWPWUd9G5m9pTEn+P+9gLIdrhGZMqnuJlvmtjbC28lMnAEGxbrduoToSSpIZK1/5ZyL8=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 spf=pass  smtp.mailfrom=devnull@uvos.xyz;
 dmarc=pass header.from=<devnull@uvos.xyz>
Received: from UVOSLinux (aftr-37-201-192-117.unity-media.net
 [37.201.192.117]) by mx.zoho.eu
 with SMTPS id 1628783630140636.4421334327841;
 Thu, 12 Aug 2021 17:53:50 +0200 (CEST)
Date: Thu, 12 Aug 2021 17:53:48 +0200
From: Dev Null <devnull@uvos.xyz>
To: alsa-devel@alsa-project.org
Subject: ASoC: question about asoc and external modem used with mux
Message-Id: <20210812175348.78eb56e3595c4b0cb0a60225@uvos.xyz>
Organization: UVOS Organization
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi,

On the motorola droid 4 (xt894 rch/arm/boot/dts/omap4-droid4-xt894.dts)
the cpcap asoc codec  is used for sound (sound/soc/codecs/cpcap.c). The
codec contains a hifi and voice DAI and mixer controlls to connect the
various outputs (headphones, internal speaker, earpiece etc) to these
dai. The hardware setup looks like this
https://lkml.org/lkml/2018/3/27/1225 with the cpcap chip acting as a
mux for various other devices on the pcb. The modem is one of these
devices. 

The problem is that the kernel has really no way of knowing if the
modem is outputing anything or not and thus if the mixer is setup sutch
that the modem is driving some output though dapm route (eg the
earpiece), the entire dapm route chain will remain off and inactive
causeing the kernel to disable the Earpiece PGA. Thus no output makes
it out of the device and the voice call fails unless one messes with
the registers to enable Earpiece PGA by hand.

Now i know of various ways to hack this problem away and have been
looking at the asoc/ alsa documentation for some time now but i really
cant seam to figure out how to solve this problem correctly. Really i
would need a way to pin the voice dai to be considerd allways active by
the kernel so that all downsteam devices get truned on when the mixer
is setup sutch that they are conected in a route.  Or give userspace a
mixer switch or other mechanisum to tell the kernel that the modem is
currently actively playing sound.

any help that can be given in this problem would me mutch appreciated.

-- 
Dev Null <devnull@uvos.xyz>
