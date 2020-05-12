Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 950441CEC2C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 06:49:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2FF1655;
	Tue, 12 May 2020 06:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2FF1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589258958;
	bh=9lZrcJ5Li2u4RfGKnDHE+ztGDxZNW0S6uHn570uI2b4=;
	h=From:To:In-Reply-To:Subject:Date:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcwFbvabl5ETz3e1mmj17e/85nyA9OwPd9EbpkZ4NPInvFanYVtRVJltPDQlVoPKG
	 9reApHiEYP3VUXo8Mp2c6UMUqamKjBz/BYwCua9KOTMOjtJrW9EAVk43uiT5yBRmc5
	 xDVTj4ImDqdd75Ve7GC/1Fsfdl3C8ixhhXlJPWDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A95AF800AA;
	Tue, 12 May 2020 06:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8CCDF8014C; Tue, 12 May 2020 06:47:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 183CDF800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 06:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 183CDF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="LH44jrvm"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200512044717epoutp04b608792b67ec12c7a9229b1a1c5bfee8~OLn37sqKz2784627846epoutp04s
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 04:47:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200512044717epoutp04b608792b67ec12c7a9229b1a1c5bfee8~OLn37sqKz2784627846epoutp04s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589258837;
 bh=4RDg87gneuQ98znWmxSurlC9rOGTnIHdKcZqujVHUCU=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=LH44jrvmSjjzIAn/Ipr2h9yECxVBPeZkaR7NfPLkN/0noTNZTFjZzh+Wv0rkk2FB+
 HskUFeoluCNTDXp6xwCKNFRB3yJdpaBxM4glWur0V1ZrnNqma5EjdDBgprs6mrVSp/
 U+JIpZerDFCe3yqrIQtKHwgTlyHEA6TiVm6fdAKI=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20200512044716epcas2p4ca39637884bea2bd841148b8ac8700bf~OLn25fTve1276412764epcas2p4R;
 Tue, 12 May 2020 04:47:16 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.191]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 49Lldt61RBzMqYkf; Tue, 12 May
 2020 04:47:14 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 1A.FF.04393.05A2ABE5; Tue, 12 May 2020 13:47:13 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20200512044712epcas2p1766549e6282e081cc7fbab8a1410f27b~OLnzuSg4w1409214092epcas2p1C;
 Tue, 12 May 2020 04:47:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512044712epsmtrp23033cab402edb46147d7a0fcaf96505d~OLnzs_rAs2595225952epsmtrp2C;
 Tue, 12 May 2020 04:47:12 +0000 (GMT)
X-AuditID: b6c32a47-67fff70000001129-34-5eba2a500f01
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 28.8E.18461.05A2ABE5; Tue, 12 May 2020 13:47:12 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.182.130]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200512044712epsmtip2a2c330a061c88c9e698bae64a041db59~OLnzZMOw02174821748epsmtip2F;
 Tue, 12 May 2020 04:47:12 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.intel.com>,
 <broonie@kernel.org>
In-Reply-To: <1fd436c2-373e-a332-02e6-c7b919a8fd0c@linux.intel.com>
Subject: RE: [PATCH] ASoC: soc-dai: pull out be_hw_params_fixup from
 snd_soc_dai_hw_params
Date: Tue, 12 May 2020 13:47:11 +0900
Message-ID: <000001d62818$66cc9ce0$3465d6a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFLuTBbSd0JdfH5D9qyzftkO2cFjQIRRQzuAaP5Weypmv7OsA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0hTcRjld+92d7VWt6n5JWHjhlGSuq1m19DoRY00MqKgl3ZxNzfai90p
 KUGaPWZWKBTUrCW9CCN8MEztyZyYvahUepCiZCuNLB+Zilbb7iL/O9/5zuE73+9B4rIGIorU
 m2yc1cQaaCJUVNe0hInbGtuYoXCPYUz7KzfGnOvpJZjzdSUiprCrlGBudbgwZrTdjjETf7wY
 0/zqKsZU/7qNGE/hWWx1qKZ6+AihaXB0SjS1lcWExtm6VXPGVYk0Va4OUTqxy5Cs41gtZ5Vz
 piyzVm/KTqFTt2Wuy1QnKpRxyiRmBS03sUYuhV6flh63QW/wRaPluawhx0elszxPJ6xKtppz
 bJxcZ+ZtKTRn0RosSqUlnmeNfI4pOz7LbFypVChUap9yn0HX13RabPkSfbCtc3sBcs47iUJI
 oJbD8Mg1yUkUSsqoegQvi38EiyEEZfe6xUIxiqCg0yH+Z+k4ciOouo+g4dRPXCj6EHy41hxQ
 EVQcjHR9wP04nNoNrWXtIr8IpzwIvB+bRP5GCLUOym9dRH4cRu2B+j+VmB+LqBh4cedrAEup
 JBh/7RELeA60XugNeHFqAdz5dhEXIslh/NMNsTBsLYyeaMMFTTiUFx8PpAPKRYLzlAcJhvUw
 NeANmsOgv8UlEXAUDA/cJwRDEYKB55PBxlkExSUyAS8D16UnvnSkb8ISqGpM8EOgFoLnfTDb
 LLA3TUkEWgr240EjDTVPfmMCDeCslpQi2jFtMce0xRzTFnD8H1WBRJVoLmfhjdkcr7Ism37Z
 tSjwbGM31qO6F2luRJGInim1qxoyZGI2l88zuhGQOB0uPar3UVItm5fPWc2Z1hwDx7uR2nfu
 ZXhURJbZ9wlMtkylWpWYqEhSM+pEFUNHSmtnvNsjo7JZG3eA4yyc9Z8PI0OiCpCqWzH4sLvi
 Zaj2WEdP1QimHVgw2sImeXMLdyUvfZwcYS5NWLM3pqWk/rA336nMKog+oR93P3vw9M1gM9pf
 rgi7/uw71n85pi0i9e1k0exFVUVDj35dsTdOGGqib26oGZoffTlS2lu6VLdl8YVD0hVE5Fhe
 Werk5807+6+Wb9px9/p7WsTrWGUsbuXZv2tgP3LMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvG6A1q44g4v7xC2uXDzEZDH14RM2
 ixnbulksGu9NYLNYfXULk8W3Kx1MFr/+P2OyOHpxMZPFhu9rGS2ONE5hcuDy2PC5ic1j56y7
 7B6bVnWyecw7GejRt2UVo8f6LVdZAtiiuGxSUnMyy1KL9O0SuDJeHu5lLXghV3H5bmgD4zzJ
 LkZODgkBE4mrTcvYQWwhgd2MEidf2EPEJSQ+zD/DDmELS9xvOcLaxcgFVPOcUWLH6acsIAk2
 AV2JL/fuMIPYIgLREicnXmEBKWIWOMcosX1TIxtExyFGiclzuphAqjgFnCVmr57DCGILC0RJ
 XFqzGWwFi4CqxLntr8FqeAUsJX5eAlkHYgtKnJz5BGwbs4C2xNObT6FseYntb+cwQ5ynIPHz
 6TJWiCucJL61X2aGqBGRmN3ZxjyBUXgWklGzkIyahWTULCQtCxhZVjFKphYU56bnFhsWGOal
 lusVJ+YWl+al6yXn525iBMedluYOxu2rPugdYmTiYAR6koNZSYS3JXNnnBBvSmJlVWpRfnxR
 aU5q8SFGaQ4WJXHeG4UL44QE0hNLUrNTUwtSi2CyTBycUg1Mux59PXO+fdPEK1pyr20Pd77d
 os1pNN0/4PIb1behT094L5edZ1Q4QcAzelvptELjpKzHgrfj3hl1Cx2+wSF77oPg/YULHpTN
 fhL7e9JdSZna52ofMowPdu7Q5mH/8bn2ZKFeoS17fcn0sOkvtbi9LnS3+iz+brJfS5jvwspT
 Dw/cim37oVWhWd4r6esTxP/jNK/Lx10i725UrMtxOTojfw/PLEu3lIazQW3z3T7Y61y0/cKk
 K/Zq8ne/wNblMqVNhyQdk91KXd88X294JXv2pHm33U5r8dje5pHUkDnmtY7tqcb0fXOvLPJi
 D3RRksmqF7DYcu9zwu/eTqduqbccN/b4pyzY/flY1gbOBx27lFiKMxINtZiLihMBQqzJZioD
 AAA=
X-CMS-MailID: 20200512044712epcas2p1766549e6282e081cc7fbab8a1410f27b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200511033107epcas2p2465bc53295b38d2723c4bc351da77c5e
References: <CGME20200511033107epcas2p2465bc53295b38d2723c4bc351da77c5e@epcas2p2.samsung.com>
 <000001d62744$9b631670$d2294350$@samsung.com>
 <1fd436c2-373e-a332-02e6-c7b919a8fd0c@linux.intel.com>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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

On 5/12/20 03:47 AM, Pierre-Louis Bossart wrote:
>On 5/10/20 10:31 PM, Gyeongtaek Lee wrote:
>> When dpcm_be_dai_hw_params() called, be_hw_params_fixup() callback is
>> called with same arguments 3times.
>> It is called in be_hw_params_fixup() itself and in soc_pcm_hw_params()
>> for cpu dai and codec dai.
>> Tested in 5.4.
>> 
>> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
>> Cc: stable@vger.kernel.org
>> ---
>>   sound/soc/soc-dai.c  | 12 ------------
>>   sound/soc/soc-dapm.c | 11 +++++++++++
>>   2 files changed, 11 insertions(+), 12 deletions(-)
>> 
>> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
>> index 31c41559034b..4785cb6b336f 100644
>> --- a/sound/soc/soc-dai.c
>> +++ b/sound/soc/soc-dai.c
>> @@ -257,20 +257,8 @@ int snd_soc_dai_hw_params(struct snd_soc_dai *dai,
>>   			  struct snd_pcm_substream *substream,
>>   			  struct snd_pcm_hw_params *params)
>>   {
>> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>   	int ret;
>>   
>> -	/* perform any topology hw_params fixups before DAI  */
>> -	if (rtd->dai_link->be_hw_params_fixup) {
>> -		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
>> -		if (ret < 0) {
>> -			dev_err(rtd->dev,
>> -				"ASoC: hw_params topology fixup failed %d\n",
>> -				ret);
>> -			return ret;
>> -		}
>> -	}
>> -
>
>Sorry I don't get this change.
>
>If the be_hw_params_fixup() callback is called three times, it's because 
>the soc_soc_dai_hw_params() routine is called three times, so what is 
>the problem here?
>
>Also the comment is explicit about doing fixups before calling the dai 
>hw_params() callback, so that is not longer the case with this change? 
>Even if the change was legit, the comment is no longer relevant and 
>should be updated.
>
Sorry, the comment was too short and inexact to explain the intention of the patch.
When dpcm_be_dai_hw_params() called, be_hw_params_fixup() is called three times
with same substream and params in dpcm_be_dai_hw_params() and
snd_soc_dai_hw_params() in soc_pcm_hw_params() for cpu dai and codec dai.
Calling same code three times may not be a problem in most systems, but in some
system which has limited computing power and changes audio routing frequently,
couple of milliseconds are consumed and make the system a little bit slower to
audio response.
If the be_hw_params_fixup() could be pull out from soc_soc_dai_hw_params(),
and make it call once at pcm start or routing change, response time can be increased.

In my search, the only point that calls snd_soc_dai_hw_params() without 
calling be_hw_params_fixup() callback directly is snd_soc_dai_link_event_pre_pmu().
So, I proposed pulling out be_hw_params_fixup() from snd_soc_dai_hw_params() and then
add direct call to be_hw_params_fixup() callback in snd_soc_dai_link_event_pre_pmu()
not to harm current working process. 
>>   	if (dai->driver->ops->hw_params) {
>>   		ret = dai->driver->ops->hw_params(substream, params, dai);
>>   		if (ret < 0) {
>> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
>> index e2632841b321..d86c1cd4e8fa 100644
>> --- a/sound/soc/soc-dapm.c
>> +++ b/sound/soc/soc-dapm.c
>> @@ -3886,6 +3886,17 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
>>   	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max
>>   		= config->channels_max;
>>   
>> +	/* perform any topology hw_params fixups before DAI  */
>> +	if (rtd->dai_link->be_hw_params_fixup) {
>> +		ret = rtd->dai_link->be_hw_params_fixup(rtd, params);
>> +		if (ret < 0) {
>> +			dev_err(rtd->dev,
>> +				"ASoC: hw_params topology fixup failed %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>>   	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
>>   	snd_soc_dapm_widget_for_each_source_path(w, path) {
>>   		source = path->source->priv;
>> 
>> base-commit: f3643491bd079c973ac6c693da7966cd17506ca3
>> 
>

