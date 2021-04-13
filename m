Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEF335E33F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 17:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5096D1690;
	Tue, 13 Apr 2021 17:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5096D1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618329382;
	bh=ylZeFo6iHKlDHxbtjWyku1Pd16gS0sPtpE62yQMeiUk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TYnv/BMuC2eTAM1uB6JhBTUs8+cFk4GZ7VsSfun+iEjibaDqYQBsM2ZegswmP5BxH
	 h4nK3ub5r7YXUSYPZ8Dbt1UAEPHEBCjnsxfJO6EooAIX70CfNEU+ikEMpdYhr9Jcj7
	 LN4BEJX2pHG5zz+0ddAES7TsGvND+lkQNbygxv1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A90F800FF;
	Tue, 13 Apr 2021 17:55:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A41BF80254; Tue, 13 Apr 2021 17:55:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77D12F8021D
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 17:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77D12F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="VwifJ/ft"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hKmYn2CZASEyzKkrO5tiY2UZuUSERg+01sRfPY8Al78=; b=VwifJ/ft6zs3znvzgek6Yv9hpD
 wcF+vcwd0VbRCC+UOYUEQzlg9neXNFeUhgozFQ+Z78ngU98ANzRQdkFRaZK5SiBw8+PhnwXzLWI8N
 LxGFlB3cDZkYU9/BbjOA+lv0Or13Ky38XFXqCXUdgNhj548vHj6LovdzWGmPLXxpDNnD75Wgddst/
 COZjdUmpCSATUXNiR3tGdQlp8goIFEKEeSsG3SI46ZGWCFynrdEQJ712z9JQrnGNMyOZeVL3ADqqL
 +Jcfu7Ity/k2AXzWO2X3HlwOCuDoXpySXEd6KUhQZPteJ0YM4iVnZ1n8RbIZ0AP5HpRpK7KNUe/oN
 5DSIDL3g==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lWLNn-000kys-CS; Tue, 13 Apr 2021 17:55:19 +0200
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>
References: <20210410120229.1172054-1-coding@diwic.se>
 <s5him4r3k1d.wl-tiwai@suse.de>
 <e912ae71-5b52-8b1f-b3fa-b9bb6420be29@diwic.se>
 <s5hy2dmw6ga.wl-tiwai@suse.de>
From: David Henningsson <coding@diwic.se>
Message-ID: <56690a06-d075-53cb-e994-2d1c8031ce5e@diwic.se>
Date: Tue, 13 Apr 2021 17:55:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5hy2dmw6ga.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Id: coding@diwic.se
Cc: alsa-devel@alsa-project.org
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


On 2021-04-13 17:27, Takashi Iwai wrote:
> On Mon, 12 Apr 2021 21:32:37 +0200,
> David Henningsson wrote:
>>> One thing I'm considering is how to inform the current framing and the
>>> timestamp mode to user-space.  Currently we have only the ioctl to set
>>> the values but not to inquiry.
>> Yes, this is the same as we do with PCM. There is no ioctl to get
>> current hw/sw params either.
>>
>>> Should we put those new information into the info or the status ioctl?
>> I would prefer neither, because it is not necessary and creates an
>> inconsistency with PCM.
> Well, honestly speaking, ALSA PCM API design is no best one you should
> refer to...  IMO, it should have had the symmetric get function, too.
> I guess it worked without such ioctl because the current PCM status is
> exposed via proc file.  Without a way for inquiry of the current
> status, we may have had trouble for debugging.

Whether or not the ALSA pcm/rawmidi apis should have get functions to 
get its current parameters, seems like a separate discussion, and 
separate patch. It can be done later if there is such a need.

>
> In that sense, it might make sense to extend the proc entry of the
> rawmidi status output, too.
Okay, I can add rows about framing and clock type in the proc file for v5.
>>> If so, it might be also helpful to inform the frame byte size
>>> explicitly there, instead of assuming only a constant.
>> If userspace has verified the kernel protocol version and successfully
>> calledSNDRV_RAWMIDI_IOCTL_PARAMS with the framing
>> byte/bitfield/whatever set, then userspace can be sure that the frames
>> are according to the snd_rawmidi_framing_tstamp struct. Knowing the
>> frame byte size but not knowing the exact format is of no use to
>> userspace anyway, right?
> Sure, if any, the kernel should inform all stuff, the frame type, the
> clock type, and the frame size.  But practically seen, this might be
> not often inquired, if we define the frame struct explicitly as a part
> of user-space API, too.  Then sizeof() already gives the proper size.
> Of course, that depends on how to provide the user-space API.  We may
> provide again an opaque API, too.

The frame struct will be part of the userspace and alsa-lib APIs. I 
intend to follow up with patches to alsa-lib after this patch gets merged.

// David


