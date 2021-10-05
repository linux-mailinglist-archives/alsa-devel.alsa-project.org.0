Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB6042218B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 10:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04DDC1670;
	Tue,  5 Oct 2021 10:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04DDC1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633424374;
	bh=gDaR21nwdWaXt7fsEvuW9ns5MmTV42FKU/r49X49t9I=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNRAVD+XWdm0D9OB3IOUQ+MK+27nvSdLR14M/7EqD3npeuntwb1pmRCiQ+mWWmjZ/
	 wEFY3fSK1ivU+ecJSQM/4Cfm3hGWZP+vecZiOnGWrE051HXJmRW2llsKhFGeHkgoxx
	 1skXq3KxMCAaDZKfm+jlfunHztMmogkg1hjnjtlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F71BF8028B;
	Tue,  5 Oct 2021 10:58:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D132CF8027D; Tue,  5 Oct 2021 10:58:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F63FF8020D
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 10:58:07 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5C349A003F;
 Tue,  5 Oct 2021 10:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5C349A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1633424286; bh=Q1CexVkL1llbDsjQ0tjANgKTo2iLo1vTSglIf8ywE4E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fUrOwJvBcV7SZZtxoOBfgmtKV1/TWxlx8jtWwaJ2PAVv/Cvs/1zde5u4bfiemxnlj
 lKR8oH6Q+vFxvispY862++KeeqMe83c4nO4jo8MBqELK+o87wiShvgJrwtp7CExe7j
 soTPh/oJ/ViQ9rJ5sfCg8F9Fl4xJV+8TZAhGJOdQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  5 Oct 2021 10:58:04 +0200 (CEST)
Message-ID: <36b2762f-8527-639c-274c-3efa40562eab@perex.cz>
Date: Tue, 5 Oct 2021 10:58:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Alsaloop: sync mode PLAYSHIFT + Loopback on playback side
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>
References: <a87670e2-302b-8408-cdc2-f0f010646fdc@ivitera.com>
 <958623cd-7d0d-5329-567b-74edbbf0c16d@perex.cz>
 <b18c5b00-e3a8-14d1-15aa-c7d7c577530d@ivitera.com>
 <2ad744ed-5618-0ea0-e2a4-b919ee9dfeeb@perex.cz>
 <c9804070-e520-24e5-d5a7-9ba7e2bb8abe@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <c9804070-e520-24e5-d5a7-9ba7e2bb8abe@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 04. 10. 21 16:32, Pavel Hofman wrote:

> 
> +static int openctl_play_rateshift(struct loopback_handle *lhandle,
> +			char *ascii_name) {

I would create 'openctl_elem_ascii' function which will accept the ascii id 
and the snd_ctl_elem_value_t pointer like 'openctl_elem' does. The the common 
code may be moved to the 'openctl_elem_id' function from the 'openctl_elem' 
function.

But it's just nitpicking, the rest of patch looks fine and follows my 
suggestion. Thank you.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
