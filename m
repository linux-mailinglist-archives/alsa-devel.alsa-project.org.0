Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F512F35F0
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 17:42:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47FD51706;
	Tue, 12 Jan 2021 17:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47FD51706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610469759;
	bh=U7eXzNWchQJkksD97D6Efd/n/F4OmbgZqcwJFX83d/g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOIBYU8tKzB4aiX2NDVPxYji9YYQSpnZnqv+/a/tzXb7cxycE7yuuKn+GcOSVCxjM
	 uhC3l8/E0XSStsUg0hAmFu91LN+xnUWSggQ6WSV3J//O/cMFWPlE40CypBYZgwlNR4
	 lFXUOgHookAll9jqfMsrEXWPNIs8+tQcnrpbBsy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96802F80113;
	Tue, 12 Jan 2021 17:41:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F68F8025E; Tue, 12 Jan 2021 17:41:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99272F80113
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 17:41:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99272F80113
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id CE7031F44B67
Subject: Re: [PATCH 1/2] cros_ec_commands: Add EC_CODEC_I2S_RX_RESET
To: Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@google.com>
References: <20210107085942.2891525-1-yuhsuan@chromium.org>
 <20210107135459.GB4726@sirena.org.uk>
 <CAGvk5PqMCEib8Yr=V4SxT0BBMoC1+yGXm0y+52+LwC5dPQUVnA@mail.gmail.com>
 <20210112004207.GN4728@sirena.org.uk>
 <CABXOdTc-HkVW7UuDLoWf2opVO1n-W2EF-E2hJEm_D6=2P32_qw@mail.gmail.com>
 <20210112141036.GC4646@sirena.org.uk>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <253ab603-f082-6e96-9303-7e127e743906@collabora.com>
Date: Tue, 12 Jan 2021 17:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112141036.GC4646@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Prashant Malani <pmalani@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

On 12/1/21 15:10, Mark Brown wrote:
> On Mon, Jan 11, 2021 at 05:52:31PM -0800, Guenter Roeck wrote:
>> On Mon, Jan 11, 2021 at 4:42 PM Mark Brown <broonie@kernel.org> wrote:
> 
>>> TBH that seems like a big enough change to split out from this and done
>>> as a separate series, I'd be perfectly happy to apply your original
>>> change.  I guess part of doing that sync up should ideally be to
>>> refactor things so that it can be done mechanically in future.
> 
>> Being able to do it mechanically was the idea for introducing the script.
>> Unfortunately it doesn't help to have such a script if people don't use it.
> 
> Looking at the issues Yu-Hsuan mentions and briefly at the code I guess
> there's some updates needed with the script for namespacing around at
> least pd_ to avoid the need for hand massaging things, that'll put
> people off using the script.
> 

I even didn't know about that script :-(, or forget about it, assuming the files
are async again, I think I'm fine on only introduce that line of code instead of
a full sync (and lets think how we can do better work on this and solve in the
chrome-platform tree). I have some comments on patch 2, though.

Cheers,
  Enric
