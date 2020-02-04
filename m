Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6F1516EE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 09:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C06D168D;
	Tue,  4 Feb 2020 09:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C06D168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580804429;
	bh=IhalYax4KqnQ2EljIGekOB1OCSP2Ws0RfvdQ8Hb5DQQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O1b7kgKT52Z+P7v89T5UXcP+NQ7ACZmG8RZ6+IJo5GkKiRATcs9XmKu5b5Vljdbe8
	 9JePUdLNidxXJ1r/Lr14XIGPi1lq3thCYbos8ZlnekyJr+Sz2R8X48kbLtVUn+WcP+
	 /a/YEsfEGJJWTazJv4yttn0LFIxWcRcSHZycba+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20FDCF800AB;
	Tue,  4 Feb 2020 09:18:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4D15F80162; Tue,  4 Feb 2020 09:18:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2020BF800AB
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 09:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2020BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="a69167y0"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3928d00000>; Tue, 04 Feb 2020 00:18:24 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 04 Feb 2020 00:18:38 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 04 Feb 2020 00:18:38 -0800
Received: from [10.24.218.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 08:18:36 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20200204072017.9554-1-nmahale@nvidia.com>
 <20200204072017.9554-4-nmahale@nvidia.com> <s5hy2ti7pya.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
Message-ID: <7381723b-655f-e0e4-590b-c053ec016382@nvidia.com>
Date: Tue, 4 Feb 2020 13:48:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hy2ti7pya.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580804304; bh=PQwmLsGW6DuVMIhYk/1sivskWxYTjNIHlOL6mUpm/Ec=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=a69167y0hLKcKYMtMxsdMedpjtHcIrshcWzypDGfZy2eVYGAGw7VZ28jLN29uaLJl
 YwlZtFNy2hNiegf6eo/FzkejjQ7tqLtkzFkWymGLW2ln/WHkFOSKc84JA3sshzSJjM
 KenXnetvO0eXLX+iVem17pu9AUYGBrnzsZd5h0lZ3JmsgXjqXgT5UOBTmt5f3BLBaQ
 2UqQZR00D1PYr+pXJIoVZs5lpoiBu8bEOq/GaCN76PHJWiqX+9vG8QMu3i8ogyecGy
 pBEuIyELHZpS8OmwQKYnAvqkunuzF/my8/hkEx4BcpFXmQMQ3IOL7BhxkVwqIGGYUB
 j5z/SyzWnhx8Q==
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 aplattner@nvidia.com, martin@larkos.de, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v1 4/4] ALSA: hda - Fix DP-MST support for
	NVIDIA codecs
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

On 2/4/20 1:18 PM, Takashi Iwai wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, 04 Feb 2020 08:20:17 +0100,
> Nikhil Mahale wrote:
>>
>> If dyn_pcm_assign is set, different jack objects are being created
>> for pcm and pins.
>>
>> If dyn_pcm_assign is set, generic_hdmi_build_jack() calls into
>> add_hdmi_jack_kctl() to create and track separate jack object for
>> pcm. Like sync_eld_via_acomp(), hdmi_present_sense_via_verbs() also
>> need to report status change of the pcm jack.
>>
>> Rename pin_idx_to_jack() to pin_idx_to_pcm_jack(). Update
>> hdmi_present_sense_via_verbs() to report plug state of pcm jack
>> object. Unlike sync_eld_via_acomp(), for !acomp drivers the pcm
>> jack's plug state must be consistent with plug state
>> of pin's jack.
>>
>> Fixes: 5398e94fb753 ALSA: hda - Add DP-MST support for NVIDIA codecs
> 
> It's a wrong format.  It should be Fixes: xxxx ("blah blah")
> 
>> Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
> 
> As mentioned in the previous post, the fix must be applicable to 5.5
> kernel as it's a clear regression.  Get it fixed at first, then go for
> cleanup the rest.
Okey, first I send patch to fix the issue. But are you agree with
logic/direction of this patch? Here, I simply keep plug status
of pcm jack consistent with that of pin jack.

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
