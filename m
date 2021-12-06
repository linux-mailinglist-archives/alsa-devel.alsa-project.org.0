Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F279146A174
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 17:33:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660D120A9;
	Mon,  6 Dec 2021 17:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660D120A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638808428;
	bh=X7D5BJsQScnG8sLpnmln8wsioOvFu8623kR6lpJy3qg=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMtt4FrgbKcUnl1sjFBuKeHf1hQx7cu9kCKBIMwsPrtMEDayZTD1RQbSUA2JIJ5Vz
	 xrDlYD/B8yFHd6iafMQOcDa/iz4ffOMxLp3Hp72lJ6Cs4MGe4GGbxNbIQNSPyittOh
	 ziDNO/e1rLZps36Cc91wx8RvMAGVafBlYTrRov3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3530F804ED;
	Mon,  6 Dec 2021 17:32:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7F8AF804EC; Mon,  6 Dec 2021 17:32:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F894F80118
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 17:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F894F80118
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="224602329"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="224602329"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 08:31:21 -0800
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="460890134"
Received: from jcsee-mobl2.ccr.corp.intel.com (HELO [10.209.128.127])
 ([10.209.128.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 08:31:20 -0800
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Shuah Khan <shuah@kernel.org>, Jaroslav Kysela <perex@perex.cz>
References: <20211206160305.194011-1-broonie@kernel.org>
 <33692870-fccc-6d63-2c95-056a21fff791@linux.intel.com>
Message-ID: <d9a31741-6690-2d63-f86e-555e6afa83fc@linux.intel.com>
Date: Mon, 6 Dec 2021 10:31:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <33692870-fccc-6d63-2c95-056a21fff791@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
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




>> +// This test will iterate over all cards detected in the system, exercising
> 
> would it make sense to test only specific cards? People doing automated
> tests might have a USB device for capture of analog loopbacks, or
> injection of specific streams for capture, and usually care about

typo: Usually don't care about testing such devices.

'testing the tester' is a separate endeavor.

> testing such devices - which do need manual setups and wiring btw.
> 
>> +	switch (snd_ctl_elem_info_get_type(ctl->info)) {
>> +	case SND_CTL_ELEM_TYPE_NONE:
>> +		ksft_print_msg("%s Invalid control type NONE\n", ctl->name);
>> +		err = -1;
>> +		break;
>> +
>> +	case SND_CTL_ELEM_TYPE_BOOLEAN:
>> +		int_val = snd_ctl_elem_value_get_boolean(ctl->def_val, 0);
>> +		switch (int_val) {
>> +		case 0:
>> +		case 1:
>> +			break;
>> +		default:
>> +			ksft_print_msg("%s Invalid boolean value %ld\n",
>> +				       ctl->name, int_val);
>> +			err = -1;
>> +			break;
>> +		}
>> +		break;
>> +
>> +	case SND_CTL_ELEM_TYPE_INTEGER:
>> +		int_val = snd_ctl_elem_value_get_integer(ctl->def_val, 0);
>> +
>> +		if (int_val < snd_ctl_elem_info_get_min(ctl->info)) {
>> +			ksft_print_msg("%s value %ld less than minimum %ld\n",
>> +				       ctl->name, int_val,
>> +				       snd_ctl_elem_info_get_min(ctl->info));
>> +			err = -1;
>> +		}
>> +
>> +		if (int_val > snd_ctl_elem_info_get_max(ctl->info)) {
>> +			ksft_print_msg("%s value %ld more than maximum %ld\n",
>> +				       ctl->name, int_val,
>> +				       snd_ctl_elem_info_get_max(ctl->info));
>> +			err = -1;
>> +		}
>> +
>> +		/* Only check step size if there is one and we're in bounds */
>> +		if (err >= 0 && snd_ctl_elem_info_get_step(ctl->info) &&
>> +		    (int_val - snd_ctl_elem_info_get_min(ctl->info) %
>> +		     snd_ctl_elem_info_get_step(ctl->info))) {
>> +			ksft_print_msg("%s value %ld invalid for step %ld minimum %ld\n",
>> +				       ctl->name, int_val,
>> +				       snd_ctl_elem_info_get_step(ctl->info),
>> +				       snd_ctl_elem_info_get_min(ctl->info));
>> +			err = -1;
>> +		}
>> +		break;
>> +
>> +	case SND_CTL_ELEM_TYPE_INTEGER64:
>> +		int64_val = snd_ctl_elem_value_get_integer64(ctl->def_val, 0);
>> +
>> +		if (int64_val < snd_ctl_elem_info_get_min64(ctl->info)) {
>> +			ksft_print_msg("%s value %lld less than minimum %lld\n",
>> +				       ctl->name, int64_val,
>> +				       snd_ctl_elem_info_get_min64(ctl->info));
>> +			err = -1;
>> +		}
>> +
>> +		if (int64_val > snd_ctl_elem_info_get_max64(ctl->info)) {
>> +			ksft_print_msg("%s value %lld more than maximum %lld\n",
>> +				       ctl->name, int64_val,
>> +				       snd_ctl_elem_info_get_max(ctl->info));
>> +			err = -1;
>> +		}
>> +
>> +		/* Only check step size if there is one and we're in bounds */
>> +		if (err >= 0 && snd_ctl_elem_info_get_step64(ctl->info) &&
>> +		    (int64_val - snd_ctl_elem_info_get_min64(ctl->info)) %
>> +		    snd_ctl_elem_info_get_step64(ctl->info)) {
>> +			ksft_print_msg("%s value %lld invalid for step %lld minimum %lld\n",
>> +				       ctl->name, int64_val,
>> +				       snd_ctl_elem_info_get_step64(ctl->info),
>> +				       snd_ctl_elem_info_get_min64(ctl->info));
>> +			err = -1;
>> +		}
>> +		break;
>> +
>> +	default:
>> +		/* No tests for other types */
> 
> these types include ENUMERATED, BYTES and IEC958, but see below for
> ENUMERATED...
> 
>> +		ksft_test_result_skip("get_value.%d.%d\n",
>> +				      ctl->card->card, ctl->elem);
>> +		return;
>> +	}
>> +
>> +out:
>> +	ksft_test_result(err >= 0, "get_value.%d.%d\n",
>> +			 ctl->card->card, ctl->elem);
>> +}
>> +
>> +bool show_mismatch(struct ctl_data *ctl, int index,
>> +		   snd_ctl_elem_value_t *read_val,
>> +		   snd_ctl_elem_value_t *expected_val)
>> +{
>> +	long long expected_int, read_int;
>> +
>> +	/*
>> +	 * We factor out the code to compare values representable as
>> +	 * integers, ensure that check doesn't log otherwise.
>> +	 */
>> +	expected_int = 0;
>> +	read_int = 0;
>> +
>> +	switch (snd_ctl_elem_info_get_type(ctl->info)) {
>> +	case SND_CTL_ELEM_TYPE_BOOLEAN:
>> +		expected_int = snd_ctl_elem_value_get_boolean(expected_val,
>> +							      index);
>> +		read_int = snd_ctl_elem_value_get_boolean(read_val, index);
>> +		break;
>> +
>> +	case SND_CTL_ELEM_TYPE_INTEGER:
>> +		expected_int = snd_ctl_elem_value_get_integer(expected_val,
>> +							      index);
>> +		read_int = snd_ctl_elem_value_get_integer(read_val, index);
>> +		break;
>> +
>> +	case SND_CTL_ELEM_TYPE_INTEGER64:
>> +		expected_int = snd_ctl_elem_value_get_integer64(expected_val,
>> +								index);
>> +		read_int = snd_ctl_elem_value_get_integer64(read_val,
>> +							    index);
>> +		break;
>> +
>> +	case SND_CTL_ELEM_TYPE_ENUMERATED:
> 
> ... here you are handling ENUMERATED types?
> 
>> +		expected_int = snd_ctl_elem_value_get_enumerated(expected_val,
>> +								 index);
>> +		read_int = snd_ctl_elem_value_get_enumerated(read_val,
>> +							     index);
>> +		break;
>> +
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (expected_int != read_int) {
>> +		ksft_print_msg("%s.%d expected %lld but read %lld\n",
>> +			       ctl->name, index, expected_int, read_int);
>> +		return true;
>> +	} else {
>> +		return false;
>> +	}
>> +}
> 
