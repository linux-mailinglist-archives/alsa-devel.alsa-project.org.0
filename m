Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13142158A36
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 08:09:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A96D51668;
	Tue, 11 Feb 2020 08:08:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A96D51668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581404941;
	bh=iA++sjUUTfEunoZKV653CXOobTb7qiED9JJmmwcunXM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RigZEmENB3SkiLecQQf3SR7sFWrCiklfSRWe+Y0p5bZLfjs+NsvwWlcnLpiWoGqkH
	 AzxylqA3sdZV6d1TzTKPVYXACyiY4T/oELzKfZN6GoElZlLljsBRrYqc5syMtZA1z0
	 TUQvP7pEhQFUm5VvOEg9wB53CUX2fNrH2iAQhpCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41345F80147;
	Tue, 11 Feb 2020 08:06:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAE54F8013D; Tue, 11 Feb 2020 05:01:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5C0EF800F0
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 05:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C0EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EbGgUBfo"
Received: by mail-io1-xd44.google.com with SMTP id s24so10204057iog.5
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 20:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4buYt5AgDWSnOLoqzB+NXq6gHo2NLQrY6EneimmcY/I=;
 b=EbGgUBfok7BXKQEyRgMinLqphU/3PooP89wWbd7vhKCl0g7lneRf95+Z9BHqJ2sNUI
 1+sgmoIVjtBNd1K4HhnUvO4vme2Ku/db+TkQXH+BpC9jqtSa8Zl7KC2L4T4qSebA+wze
 6jig6NnzJnpimA+riQaQbTWJSnFMqHnIOLMBPYnZ5Tf+UZMfdBwdFpWI3fOarIL9y08s
 AgL1oljChdQBeN3e6LQHHNqzhvfuoOkcUL++Qj42ndnF9umZ2J9DrNKMAvtC0J4GgK2q
 PtFfH9EydP5T4LBKVl+r5tkDa2hIur/xg9jlZN4v3FU2Ij2lf0/P311eU4zgmxJDsbk2
 4Fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4buYt5AgDWSnOLoqzB+NXq6gHo2NLQrY6EneimmcY/I=;
 b=bZ+FWo0yOvPDIta4a879JezHF3E6b1prvI4oVdjbChTca7za38kCs9rtWAqgLB5NdT
 fd23ZePH25QOV26yrkcNt6sQCdTxUTDKUzuB/CN3cCAFvMGSFdiOAExQ+lys/j1bT7P0
 JJWZdnnGBbfakqDGt8gZT1wBk5OAO/VsnJxlYHdTANZgMgu/MQY95qjf4Lp9BgHz3PqA
 9IS/60+PKF3vV75SSJq2FKSb7Gf3XIi9fohUJ65bwUcpeVCLJ/IWUs26JsPhG4KZ64KH
 4Or7t+a2LkXlyFU23uST5JFq9Hf+6tW9L92Ssi2m4Ich32YHeuLWdUiy/xXUqs38GmtB
 dLBw==
X-Gm-Message-State: APjAAAWJjPd2a6TxXCixsFgcBHLqlZqSSdsnhwpqxyG+rUacBWsiK/Wu
 8vbn629V2UGc/8cCKbv6MQ2VoZl3oddntQzu1ctn1g==
X-Google-Smtp-Source: APXvYqw+08fY8RTUXanCx7m69NxM7pqghw9BLW/ZXaw5EU7f0BChsUrONvpDowoY6RhmyzszawcD+PzKxe+IyrwkgxA=
X-Received: by 2002:a02:950d:: with SMTP id y13mr12902796jah.139.1581393670761; 
 Mon, 10 Feb 2020 20:01:10 -0800 (PST)
MIME-Version: 1.0
References: <1581322611-25695-1-git-send-email-brent.lu@intel.com>
 <00ed82c4-404a-ec70-970e-56ddce9285ae@linux.intel.com>
 <CAOReqxhHfTuj6mxeX2e_ejMY8N4u+BFLfzKDgn=y5EbWLL_joA@mail.gmail.com>
 <a0aa0705-8d74-3316-13f8-8661d31e928b@linux.intel.com>
 <CAOReqxiNomQ7OOoE8LHWKH_LkaerSgsO-Yr4918Az2e_50THaA@mail.gmail.com>
In-Reply-To: <CAOReqxiNomQ7OOoE8LHWKH_LkaerSgsO-Yr4918Az2e_50THaA@mail.gmail.com>
From: Fletcher Woodruff <fletcherw@google.com>
Date: Tue, 11 Feb 2020 13:00:33 +0900
Message-ID: <CAMSu_6F5N27KY822uL8_ZD7iHDhiBYLrrFfNJe3QXtb9RNyogw@mail.gmail.com>
To: Curtis Malainey <cujomalainey@google.com>
X-Mailman-Approved-At: Tue, 11 Feb 2020 08:06:35 +0100
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, "Chiang, Mac" <mac.chiang@intel.com>,
 Mark Brown <broonie@kernel.org>, Brent Lu <brent.lu@intel.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: check SRM lock in trigger
	callback
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Feb 11, 2020 at 1:18 AM Curtis Malainey <cujomalainey@google.com> wrote:
>
> +Fletcher Woodruff
> See comment #3 in the bug. This is not a GLK specific issue. If I remember correctly Fletcher found that this was occurring on 2-3 platforms.

Yes, I tested this and saw the same bug on a Pixelbook Go which I
believe is Comet Lake.


>SST has the ability to turn on clocks on demand which is why this has not been an issue previously from what I understand on the bug.
>
> And that is a fair point, we do need to consider other users of the codec.
>
>
> On Mon, Feb 10, 2020 at 8:07 AM Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 2/10/20 9:44 AM, Curtis Malainey wrote:
>> > +Jimmy Cheng-Yi Chiang <cychiang@google.com>
>> >
>> > This error is causing pcm_open commands to fail timing requirements,
>> > sometimes taking +500ms to open the PCM as a result. This work around is
>> > required so we can meet the timing requirements. The bug is explained in
>> > detail here https://github.com/thesofproject/sof/issues/2124
>>
>> Ah, thanks for the pointer, but this still does not tell me if it's a
>> GLK-only issue or not. And if yes, there are alternate proposals
>> discussed in that issue #2124, which has been idle since November 25.
>>
>> What I am really worried is side effects on unrelated platforms.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
