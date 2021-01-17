Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71E2F9410
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 17:54:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22CB81758;
	Sun, 17 Jan 2021 17:53:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22CB81758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610902464;
	bh=NxMNkhnumF0Q70cWqt+XA4NCCkQN1waOdycLIIq2mKc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GDoJPi3F5Ad2TxJtwvvqA48++oMThowXFE0fU9CVNuvb1tDnq0xbk2bpOzlIU6k1E
	 JQ5RF1nQwL/e50vGj5pL3JaInNpX4cOMM+mYB4OXQsoJ+ktQWTY+sLmzqhzNGrf3vA
	 oUBS8vBEVVxu3B/H5YHkh4lwpRev86S2jg2znPKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F164F8026A;
	Sun, 17 Jan 2021 17:52:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 576B8F80257; Sun, 17 Jan 2021 17:52:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C22F3F80115
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 17:52:41 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A9ACAA0040;
 Sun, 17 Jan 2021 17:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A9ACAA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1610902360; bh=pONkltYzHHcbwWytTI+TZ9ecunPJlgVVo6xkX04/Dz0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=08KAn5/shRNvFT6A+4Ml4lUsT8Iw6gbmj75kLEt+8lUCQoXLxN4p1HBIA6vC3LZg/
 omzffA4eXumb6TA7xn28VXtdf7CtgD7i79gw2uYDFuAbttOqmdx6d7Gz9baKmmXeFn
 RNrFE5gmHgu8q+eG/dJ85bXI5+ORjViI2RVbrw3U=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 17 Jan 2021 17:52:37 +0100 (CET)
Subject: Re: [PATCH alsa-ucm-conf 1/3] chtnau8824: Move DAC Channel Source
 selection to Speaker/Headphones EnableSeq
To: Hans de Goede <hdegoede@redhat.com>
References: <20201216153838.34945-1-hdegoede@redhat.com>
 <7c075e59-8576-99e9-3688-1ab858e59716@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <90f18f8a-192e-fa2c-8975-93acd70006ee@perex.cz>
Date: Sun, 17 Jan 2021 17:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7c075e59-8576-99e9-3688-1ab858e59716@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 17. 01. 21 v 17:09 Hans de Goede napsal(a):
> Hi,
> 
> On 12/16/20 4:38 PM, Hans de Goede wrote:
>> Move DAC Channel Source selection to Speaker/Headphones EnableSeq.
>>
>> The main reason for doing this is to make it easier to allow using
>> variables, as the Speaker/Headphones conf files are evaluated after
>> the main HiFi.conf had a chance to set them.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> ping? It would be nice to get this series merged for proper SOF
> support.
> 
> Maybe this got confused with my other UCM chtnau8824 series which
> I send 10 days before t

Hi,

Thanks for the reminder. I though that this one was resolved. I don't think
that we need the first change - the evaluation for If and Include sequences is
executed before SectionVerb {} parsing. So the If...Define.RightOutputChannel
should be valid for SectionVerb...Include...File
"/codecs/nau8824/EnableSeq.conf". The 'DACR Channel Source' control seems to
require a static settings so keeping it in the verb init sequence has sense.

I applied the second (SST variable) patch for now. It's nice cleanup. Thanks.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
