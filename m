Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665901012A5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 05:47:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF2E1691;
	Tue, 19 Nov 2019 05:46:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF2E1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574138845;
	bh=rpADxO/dcQN0BLP7sGGhQ4zSd/g+S1CdQ4n2NqJZ/D4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+aovTgtFHJta7xHLzcY+8fwiDEk7AVtm+3tr8PbV+iK6wTJ87eygnY+Gv8fKt+bN
	 YSMP7J1YCcTDIFWsjP708rxu+N8H2zzT30Z5JJUYtQXE7295hc2UFskcnC4rn4tZHy
	 Vd2CRddZHiwGw4esSd7Q84yMoyKFU1F3uP+2gDrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D54CF80138;
	Tue, 19 Nov 2019 05:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3469BF800F4; Tue, 19 Nov 2019 05:45:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73B7FF800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 05:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73B7FF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="e40TPXsu"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3736c0000>; Mon, 18 Nov 2019 20:45:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 18 Nov 2019 20:45:33 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 18 Nov 2019 20:45:33 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 04:45:29 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191115095606.22392-1-nmahale@nvidia.com>
 <20191115095606.22392-3-nmahale@nvidia.com> <s5hd0dtjnag.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <6e8b6415-bad3-3530-4543-3ab3569b69fc@nvidia.com>
Date: Tue, 19 Nov 2019 10:15:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5hd0dtjnag.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574138734; bh=fskn0oEgFRWHbyaMJgik70jorLDDQQ7Zyspy0sTUwus=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=e40TPXsuWeEgX7/9zgXapfI/9uB/AX7KKxMXdWm0Dl0ttAnyztVTkeuiUbtlgbLnf
 qLTId3s427IMTHdeCWzV+rI91eWTAMTCfwMrbe40x/cZrNxPKUABKOEV3Sql2jSFTg
 UIXAZx9UU5qQiDJRvcNGXjKUZN08dcBrcFUyzPPZSR78nOXZq8LKJ9aRXpt80a65gp
 FU2X7OrhZk9DsoaaSFfTuDLfyoOHX3ok1cYbwIcXm62/+DQaUUDYbKAY1KUqmCpEoX
 W1encBtUlyG7cBgMuAcBTLyGtQ7saDTcnUDk96xjoL2mZBoXnlC/yLxVuLfVpydYhJ
 vmifpbOP+uTwA==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 2/5] ALSA: hda - Add DP-MST jack support
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

On 11/15/19 6:42 PM, Takashi Iwai wrote:
> On Fri, 15 Nov 2019 10:56:03 +0100,
> Nikhil Mahale wrote:
>>
>>  static struct hda_jack_tbl *
>> -snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid)
>> +snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid, int dev_id)
>>  {
>> -	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
>> +	struct hda_jack_tbl *jack =
>> +		snd_hda_jack_tbl_get_mst(codec, nid, dev_id);
>> +	struct hda_jack_tbl *existing_nid_jack =
>> +		any_jack_tbl_get_from_nid(codec, nid);
>> +
>> +	WARN_ON(dev_id != 0 && !codec->dp_mst);
>> +
>>  	if (jack)
>>  		return jack;
>>  	jack = snd_array_new(&codec->jacktbl);
>>  	if (!jack)
>>  		return NULL;
>>  	jack->nid = nid;
>> +	jack->dev_id = dev_id;
>>  	jack->jack_dirty = 1;
>> -	jack->tag = codec->jacktbl.used;
>> +	if (!existing_nid_jack)
>> +		jack->tag = codec->jacktbl.used;
>> +	else
>> +		jack->tag = existing_nid_jack->tag;
>> +
>>  	return jack;
>>  }
> 
> In this logic, we assign the same tag to multiple jack objects, and
> this will lead to the multiple calls of SET_UNSOLICITED_ENABLE on the
> same pin.  But this should be only once at parsing, and the rest
> resume init will be done from the codec regmap cache, so it's not too
> bad, I guess.
> 
> Alternatively we can set 0 to jack->tag when existing_nid_jack!=NULL,
> too, and skip SET_UNSOLICITED_ENABLE for tag==0.  But this will make
> *_get_from_tag() won't work as you intended, hence the step will be
> - get the jack once via snd_hda_jack_tbl_get_from_tag(tag)
> - get the jack again with snd_hda_jack_tbl_get_mst(jack->nid, dev_id)
> But it's more complex, and not better, either.

I am bit skeptical over this idea. One can build hypothetical case like - you create 2 jack objects, first one for (nid=1, dev_id=0) with jack->tag!=0 and second one for (nid=1, dev_id=1) with jack->tag==0. If you want free first jack object and continue working with second one then that would create problem because you lose tag with destruction of first object?

If objective is not to make multiple calls of SET_UNSOLICITED_ENABLE on the same pin, then just like jack->tag we can inherit jack->jack_detect from  existing_nid_jack. That can make sure snd_hda_jack_detect_enable_callback_mst() not to do multiple calls of SET_UNSOLICITED_ENABLE on the same pin, right?

I am suggesting code change like -

...
snd_hda_jack_tbl_new(...)
{
    [...]
    if (!existing_nid_jack) {
        jack->tag = codec->jacktbl.used;
    } else {
        jack->tag = existing_nid_jack->tag;
        jack->jack_detect = existing_nid_jack->jack_detect;
    }
    [...]
}

Thanks,
Nikhil Mahale

> thanks,
> 
> Takashi
> 

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
