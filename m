Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0792E7F9F
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:20:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F323C16EA;
	Thu, 31 Dec 2020 12:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F323C16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609413129;
	bh=mcrNFCVoc+/LuhwbLNwsohAOO72XaayGlqI7VxnHJVQ=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtXDknTyNg0j9YmbPmVlvATBvbARZe7OmQ6vgEzdomTUe9loN+fU0bGabDwNoruBb
	 2VHgtJY8UbTTsiIo6NDZE2vPqQJgImeT3VFNTXs6jrNSlT0OgGqzRCj2vPNFR88Whe
	 HiBD2QDpD53qG05yX4agUKsUzMMlPVLWmeMa4pfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F72F8022D;
	Thu, 31 Dec 2020 12:10:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C79FF8022B; Thu, 31 Dec 2020 12:10:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6773CF8015F
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 12:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6773CF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="U5JSh17i"
Received: by mail-ed1-x529.google.com with SMTP id j16so17925739edr.0
 for <alsa-devel@alsa-project.org>; Thu, 31 Dec 2020 03:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=60HjYK141PLVghL69p8+XiC3K0jS8dWaXg9nEjGfykU=;
 b=U5JSh17iW41gud9/X2N6Q2JCTVKEeOZhLuujxIry98El0393pJa9oDExiI3cYgAJS9
 vrqUqkN7GL59ZyvWNVURwS+o/shnsdUFVvflCoNzbD86lod0yeou/OwWBgrlmgZlv33q
 BlSHT106nrApJIKrBBWvEwSL+/z2d4GBPxIVPPZM4CjPmJrL5x9Mk4CoayCazhW9rFIY
 F+mp4wavarSa9k1Jo+QFTnfGzcr+AUQXbIpNlikhRTMOZqmXBs+MIdbPQC/51+BeEU/b
 5HGo5vGL/XCukEXn0MKqwguW5hNr3dC/OImuU+C6nubJKMKviihUldutLfpLY0iQQ4BM
 Efig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=60HjYK141PLVghL69p8+XiC3K0jS8dWaXg9nEjGfykU=;
 b=K/+kvJ/UNqcFkFSGMbJvvcl6JluOm9LHOyqckekyLXffJCyyk0ltFDl2dDQ+eCMA2q
 nPFV63me7OQg2BJW2ikuK9VcgMEGZkYL/+ArMEi4n2qvxaMfSBCovuJ0DXoOvedziEg/
 GB1i/dP+BTCaQTLvX77dl50r+A31IAC9zGq/q+rbEHo/C09dhlNR2zdd0kjFFnle3U5g
 GCvm8rb3wpqgIHKF0MCSwhsZQkzuIwthooBa9ldOi85j6Q7OqNn5vUWTngAp70c/8Ga1
 Ex4Yt7LBJMaqcXq1V3Vfi/4lxe0XSizPg0wu4B1WcF27lMLeyULtifX0QeYlhpAnINKW
 VfQA==
X-Gm-Message-State: AOAM531W9y2Z1aGU0JOJn1daTWNwGgVDx+0+XGXdlHsczteKLvow6T0p
 z2ZkKeMz7dcPCQinzceDmsw=
X-Google-Smtp-Source: ABdhPJx8cEvHGjw33mi4NMWo90LdHK0QnEA1T1Snvds+5zqEgXCjEXrIVXTJpT7V1gZHRqU2015nyg==
X-Received: by 2002:a05:6402:2074:: with SMTP id
 bd20mr995961edb.326.1609413019751; 
 Thu, 31 Dec 2020 03:10:19 -0800 (PST)
Received: from cl-fw-1.fritz.box
 (p200300d86714220053af1ffdd671ac4f.dip0.t-ipconnect.de.
 [2003:d8:6714:2200:53af:1ffd:d671:ac4f])
 by smtp.gmail.com with ESMTPSA id ch30sm39886535edb.8.2020.12.31.03.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 03:10:18 -0800 (PST)
Message-ID: <d6c5e253849a56b5b04ab4441c9dc0622d0083c7.camel@gmail.com>
Subject: Re: Haswell audio no longer working with new Catpt driver (was: sound)
From: Christian Labisch <clnetbox@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 31 Dec 2020 12:10:17 +0100
In-Reply-To: <a194639e-f444-da95-095d-38e07e34f72f@metafoo.de>
References: <2f0acfa1330ca6b40bff564fd317c8029eb23453.camel@gmail.com>
 <efc6d5e8abc1da3cac754cb760fff08a1887013b.camel@gmail.com>
 <X+2MzJ7bKCQTRCd/@kroah.com>
 <a194639e-f444-da95-095d-38e07e34f72f@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Akemi Yagi <toracat@elrepo.org>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Greg Kroah-Hartman <stable@vger.kernel.org>,
 Greg Kroah-Hartman <linux-kernel@vger.kernel.org>,
 Justin Forbes <jforbes@redhat.com>
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

Hi Lars-Peter,

Additional information to what I've sent you already before :
I found out that sound works with headphones (built-in audio)
But sound still does not work with speakers (built-in-audio).

Regards,
Christian

Christian Labisch
Red Hat Accelerator
clnetbox.blogspot.com
access.redhat.com/community
access.redhat.com/accelerators


On Thu, 2020-12-31 at 11:04 +0100, Lars-Peter Clausen wrote:
> On 12/31/20 9:33 AM, Greg Kroah-Hartman wrote:
> > On Wed, Dec 30, 2020 at 07:10:16PM +0100, Christian Labisch wrote:
> > > Update :
> > > 
> > > I've just tested the kernel 5.10.4 from ELRepo.
> > > Unfortunately nothing changed - still no sound.
> > Ah, sad.  Can you run 'git bisect' between 5.9 and 5.10 to determine the
> > commit that caused the problem?
> 
> The problem is that one driver was replaced with another driver. git 
> bisect wont really help to narrow down why the new driver does not work.
> 
> Christian can you run the alsa-info.sh[1] script on your system and send 
> back the result?
> 
> You say sound is not working, can you clarify that a bit? Is no sound 
> card registered? Is it registered but output stays silent?
> 
> - Lars
> 
> [1] https://www.alsa-project.org/wiki/AlsaInfo 
> <https://www.alsa-project.org/wiki/AlsaInfo>
> 
> 

