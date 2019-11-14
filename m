Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC7FC5A6
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 12:49:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5E41614;
	Thu, 14 Nov 2019 12:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5E41614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573732173;
	bh=/hv/XroE54DJauJesRdan29FAT4m44Qor6DebjqF/tI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYjo6cVW8IeNhPjNWzdLSh55rnij2PcCfsgm2R2hH7Yp0xvfmA16K6uB5D2SXyWlb
	 d7xNDdawssTK78H8/nRV0JapdYdXwgo0cDsbU6VovVrBmto3bwRCwokPMUAKfva00k
	 9GVYOcTgITJ4cfIy73DKuyb8ivmoDg8pXCMqKT9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D17D6F800CC;
	Thu, 14 Nov 2019 12:47:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76FF1F800CF; Thu, 14 Nov 2019 12:47:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77E33F80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 12:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E33F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="h0Jp62P3"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcd3edc0000>; Thu, 14 Nov 2019 03:47:40 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 03:47:41 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 14 Nov 2019 03:47:41 -0800
Received: from [10.24.218.121] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Nov
 2019 11:47:40 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20191114033704.18171-1-nmahale@nvidia.com>
 <20191114033704.18171-4-nmahale@nvidia.com> <s5ho8xen2s3.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <9a6f7ac2-998f-23ff-c606-a780c4804eba@nvidia.com>
Date: Thu, 14 Nov 2019 17:17:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <s5ho8xen2s3.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573732060; bh=Rfc+0eTKTQg4JiN5QdekVo96F4oaalvVT6q22jC+gsI=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=h0Jp62P3qlp7FJAAIcvVf3LvVinLxE8YL2ZomXketsHU0nJUFbfjoeQaRUL2H6lu5
 pDYRpTKgXz4/14hzpz0Qz82LRHEwEaCy8CWHo7wec2yLCsnw5JHVKfSdIBEzG25ApH
 WOQzOwoNVVxZdgnFiaKTpPM1HDedXY0Z5kVEkht2/EDOMvOPNbxT/MWP9NAXG2kHEM
 EX1Y+9JtlUNqtbhobG9HVHjuJ5/4VLTArrSIYCuiAIOn7YsE/U74u5pfCT8tOSYjj4
 14VGZahcSDdjOdfh08xhyCa6i+7Txrc5DvsDrQ0yDj16XnFYedFhR8SlADFMq5cxpX
 z2pf8jAYPGxEQ==
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH v1 3/5] ALSA: hda - Add DP-MST conn list
	support
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

On 11/14/19 4:27 PM, Takashi Iwai wrote:
> On Thu, 14 Nov 2019 04:37:02 +0100,
> Nikhil Mahale wrote:
>>
>> Document change notification HDA040-A for the Intel High Definition
>> Audio 1.0a specification introduces a Device Select verb for Digital
>> Display Pin Widgets that are multi-stream capable. This verb selects
>> a Device Entry that is used by subsequent Pin Widget verbs,
>> including the Get Connection List Entry verb.
>>
>> This patch queries the current Device Select value, associates it
>> with the connection list, and updates the connection list management
>> code to consider dev_id along with nid.
> 
> I don't get why this is needed.  This is the list that is added only
> from snd_hda_override_conn_list(), and you don't change that call
> pattern, so dev_id is always zero.

In follow-on patch "ALSA: hda - Add DP-MST support for non-acomp codecs",
hdmi_read_pin_conn() calls into snd_hda_set_dev_select() before
running into code path -
  
  snd_hda_get_connections()
   |-> snd_hda_get_conn_list()
        |-> read_and_add_raw_conns()
             |-> snd_hda_override_conn_list()
                  |-> add_conn_list()

If I understand spec correctly, conn_list need to read/write/track
along with device entry set into AC_VERB_SET_DEVICE_SEL verb, right?
This patch address that limited part here.

Thanks,
Nikhil Mahale

> thanks,
> 
> Takashi
> 
>>
>> Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
>> Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
>> ---
>>  sound/pci/hda/hda_codec.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
>> index a2fb19129219..8f32cab8f4a4 100644
>> --- a/sound/pci/hda/hda_codec.c
>> +++ b/sound/pci/hda/hda_codec.c
>> @@ -88,6 +88,7 @@ struct hda_conn_list {
>>  	struct list_head list;
>>  	int len;
>>  	hda_nid_t nid;
>> +	int dev_id;
>>  	hda_nid_t conns[0];
>>  };
>>  
>> @@ -96,8 +97,9 @@ static struct hda_conn_list *
>>  lookup_conn_list(struct hda_codec *codec, hda_nid_t nid)
>>  {
>>  	struct hda_conn_list *p;
>> +	int dev_id = snd_hda_get_dev_select(codec, nid);
>>  	list_for_each_entry(p, &codec->conn_list, list) {
>> -		if (p->nid == nid)
>> +		if (p->nid == nid && p->dev_id == dev_id)
>>  			return p;
>>  	}
>>  	return NULL;
>> @@ -113,6 +115,7 @@ static int add_conn_list(struct hda_codec *codec, hda_nid_t nid, int len,
>>  		return -ENOMEM;
>>  	p->len = len;
>>  	p->nid = nid;
>> +	p->dev_id = snd_hda_get_dev_select(codec, nid);
>>  	memcpy(p->conns, list, len * sizeof(hda_nid_t));
>>  	list_add(&p->list, &codec->conn_list);
>>  	return 0;
>> -- 
>> 2.16.4
>>

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
