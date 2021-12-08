Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D33E446DBBC
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 20:00:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770762614;
	Wed,  8 Dec 2021 19:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770762614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638990047;
	bh=SsuKcY/kYYf5Ojvn5cPG5BJ5bEXpkOXB4KQm2t0+1jc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P7TA0Nxq5d1oa1/bHrTm7TEys0JYwfAqAoEoiUwg6E+MB1zBqgWSl8N6nSSliDaqL
	 +TK6sGbB2j5mjTZwU4wFw4mRjAMWM2XrcSXWabPbWSeBopWbEyTY//6HE9JBPyMqLj
	 DRY3N6kWcklfgsOwHLI9nivoviTZ4uhN2VInip+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07765F800AB;
	Wed,  8 Dec 2021 19:59:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 209A0F804EC; Wed,  8 Dec 2021 19:59:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE1DAF80217
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 19:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE1DAF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="IvAcBlxq"
Received: by mail-io1-xd36.google.com with SMTP id c3so3916607iob.6
 for <alsa-devel@alsa-project.org>; Wed, 08 Dec 2021 10:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R2GgLJCPFe6bG/Ww1U3d3+U9ugmUPZHTlFwdNjfcLnU=;
 b=IvAcBlxqxCjoi10qfrfFMvChQVgExyIQ5rL7YfDbw60PIiZTug9MT0fZIG0qTQXIYi
 ZYFKWEMMu4zlA0IHfETv3Z87ZUg7VGs+aMwricz+vimMSTWsZIrixozpwWXaPiJsIsYu
 28VOdzhqIYNBdhe8MFEpcxKZx3aQzg1v5DMr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R2GgLJCPFe6bG/Ww1U3d3+U9ugmUPZHTlFwdNjfcLnU=;
 b=fDNqIbaVt+Ss8dTl1L3Zkwh7OcI7WDDOhMn9atr7+VB5Yo1q6kZ/b7wQPUZp4tFD0N
 ddaz3luhqdtD5gaVteTgiFMYpiAjqsBXJLUWGvB9V2t4FeoN0Pbz8QVgkjVpLE+x9atQ
 ld3GC91WlgiZPSx9s0GcBRehvkVNDwESeefLO8Il2anNgLz9TTzFyHIXeufv7vWB+3E4
 j9K2z0eaC8TIVQe+JIJciVTrvpW3bevftnG4AtdoZBdqVeInbWo5E6R+e40bFAvbvups
 zzEqudsPg8efF1nqBCmQY3K85gzLBmYu5QrLuEjGB26lnXpjhO9y5GMQ4xQXwQEGjlqo
 61/g==
X-Gm-Message-State: AOAM533GhTO56QGGGa90DQ/2qQV5vGsh3RyK7yi606biEr7HCpAyT80z
 Bdf//prshtsnx8LF6PURpiJO+g==
X-Google-Smtp-Source: ABdhPJyBSwL6g8/udxMy8+1IFMWT8tKmU+PAl+WCWN4trWQzTCYfIUoHy5NdGHulLHsCXMELvRCQ2Q==
X-Received: by 2002:a6b:2ccf:: with SMTP id s198mr8308321ios.101.1638989959294; 
 Wed, 08 Dec 2021 10:59:19 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id y11sm2166162ioy.19.2021.12.08.10.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 10:59:18 -0800 (PST)
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
To: Mark Brown <broonie@kernel.org>
References: <20211206160305.194011-1-broonie@kernel.org>
 <de0c5677-c2cf-d1ab-68c5-2f410d17b66c@linuxfoundation.org>
 <YbD7+C74DFlZEokt@sirena.org.uk>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <37f87d39-b5a9-46f6-2667-c0b7aafb731a@linuxfoundation.org>
Date: Wed, 8 Dec 2021 11:59:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YbD7+C74DFlZEokt@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>
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

On 12/8/21 11:39 AM, Mark Brown wrote:
> On Wed, Dec 08, 2021 at 10:42:35AM -0700, Shuah Khan wrote:
>> On 12/6/21 9:03 AM, Mark Brown wrote:
> 
>>> +SOUND - ALSA SELFTESTS
>>> +M:	Mark Brown <broonie@kernel.org>
>>> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> 
>> Please add linux-kselftest list as well here.
> 
> get_maintainers pulls it in from the wider entry (the mention of
> alsa-devel is reudnant too).
> 
>>> +int num_cards = 0;
>>> +int num_controls = 0;
>>> +struct card_data *card_list = NULL;
>>> +struct ctl_data *ctl_list = NULL;
> 
>> No need to initailize the above globals.
> 
> They're not declared static so the initial value is undefined.
> 
>>> +void find_controls(void)
>>> +{
>>> +	char name[32];
> 
>> Use SYSFS_PATH_MAX = 255 like other tools do?
> 
> This isn't a path, it's an ALSA limit for a name that is embedded in a
> struct (snd_ctl_card_info->name).  There's no magic define for these
> lengths.
> 
>>> +
>>> +			ctl_data->next = ctl_list;
>>> +			ctl_list = ctl_data;
>>> +		}
>>> +
>>> +	next_card:
> 
>> No need to indent the label
> 
> No need but it looks wrong otherwise - it's certainly what I'd expect
> for normal kernel code.
> 
>>> +	if (snd_ctl_elem_info_is_inactive(ctl->info)) {
>>> +		ksft_print_msg("%s is inactive\n", ctl->name);
>>> +		ksft_test_result_skip("get_value.%d.%d\n",
>>> +				      ctl->card->card, ctl->elem);
>>
>> The two messages could be combined?
> 
> The user facing control names almost always have spaces in them so while
> it's useful to have them for diagnostic purposes I don't think it's a
> good idea to put them in the KTAP test names, that's likely to confuse
> things trying to work with the KTAP output.  The general pattern I'm
> following for these tests is to print one or more diagnostic lines
> explaining why a tests was skipped or failed with the human readable
> control name so people can hopefully figure out what's going on and have
> the KTAP facing name that tooling will deal with be a consistent
> test.card.control format for parsers and databases dealing with test
> results en masse.
> 

Fine with me.

>>> +bool test_ctl_write_valid_boolean(struct ctl_data *ctl)
>>> +{
>>> +	int err, i, j;
>>> +	bool fail = false;
>>> +	snd_ctl_elem_value_t *val;
>>
>> Add blank line after declarations.
>>
>>> +	snd_ctl_elem_value_alloca(&val);
> 
> This is idiomatic for alsa-lib code.

This is kernel code that is going into kernel sources. Why follow
alsa-lib convention?

> 
>>> +int main(void)
>>> +{
>>> +	struct ctl_data *ctl;
>>> +
>>> +	ksft_print_header();
> 
>> Add a check for root and skil the test.
> 
> There is no need for this test to run as root in most configurations,
> it is common to provide direct access to the sound cards to some or all
> users - for example with desktop distros the entire userspace audio
> subsystem normally runs as the logged in user by default.  alsa-lib's
> card enumeration should deal with any permissions problems accessing
> cards in the system cleanly.  If the user running the test can't access
> any cards or the cards that can be accessed don't have any controls to
> test then we will find no controls during enumeration, report a plan to
> do zero tests and then exit cleanly which seems reasonable to me.  If we
> do need to explicitly bomb out rather than report zero tests we should
> be doing it based on the number of controls we find rather than the user
> we're running as.
> 

On my system, I don't see any output if run as root. Are there some tests
that work as non-root?

thanks,
-- Shuah
