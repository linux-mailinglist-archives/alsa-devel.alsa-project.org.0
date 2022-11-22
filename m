Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A42633531
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 07:24:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D5C41663;
	Tue, 22 Nov 2022 07:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D5C41663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669098243;
	bh=VSLjfv0aFr2JrqhjcHT7jgcE+zytOGvYd8zlfgU/z7o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PpVPPW7Ycbk/udHgHIj2JlS4agasZzBAeFvHMX1O2YuJvLUpnMEhVSbvCd1iMPxhM
	 ZaWdMsDzCwCmTxEsCUzLc0Q7LprURGjG82PFJ5rYuKvY7B4RVCFJ94Uaju3NeqXcr1
	 OMMtrogo7YsbMj8+VXisJkmt5Rr3+Vuwn3U/OC8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3F94F80310;
	Tue, 22 Nov 2022 07:23:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31B42F80272; Tue, 22 Nov 2022 07:23:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A65D8F80115
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 07:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A65D8F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Nw80bRPO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AM65ei4023285; Tue, 22 Nov 2022 06:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=qcppdkim1; bh=B1qicwmFpbcbXBgFTdojF19jwigCBnrtyHBSIj85chw=;
 b=Nw80bRPOarwA5zDSMN+vExIQdI3C1Xgvq5CSHGwrv9xuCLGOpycJJqzpLsxeexDGlFjg
 sdpaIVNGAZziTZ4YJOBmJbs5/88tUmKebHVPNXCGhLmTDgVDvKooqnrBkri4JWnhiUCC
 TUYHHn0f0rPykvGfoNOJ2gbgZk2YYToa6D+y7R8dEjr0rUMc1PESATdX+HBJ4KEtV0rh
 02H5RNZdZpL/hOy29t+5iBtWqKpX+9Y9r8X776E1jnG3gcdv2YsfK/t7NexMo5dLmXVA
 PV1zsZFlazyWy50MqjaOhzU5pdVrZWEi8IH0ejbIxTlN85YeaQ8hPvVY0kttdEyXvPlU eg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kxrfbxnkx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 06:22:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2AM6MqR6020595
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Nov 2022 06:22:53 GMT
Received: from [10.216.53.141] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 21 Nov
 2022 22:22:47 -0800
Message-ID: <d11068fa-c723-8b0a-7f49-6555a72db689@quicinc.com>
Date: Tue, 22 Nov 2022 11:52:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: soc-pcm.c: Add NULL check in BE reparenting
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>
References: <1669035895-12036-1-git-send-email-quic_srivasam@quicinc.com>
 <bbaa53e9-dd83-38f8-6f55-4d87ff76556b@intel.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <bbaa53e9-dd83-38f8-6f55-4d87ff76556b@intel.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: DZiGG27fqtx5a-fm7jlG15m6qmc2PWGi
X-Proofpoint-ORIG-GUID: DZiGG27fqtx5a-fm7jlG15m6qmc2PWGi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220046
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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


On 11/21/2022 8:00 PM, Cezary Rojewski wrote:
Thanks for your time Cezary!!!
> On 2022-11-21 2:04 PM, Srinivasa Rao Mandadapu wrote:
>> Add NULL check in dpcm_be_reparent API, to handle
>> kernel NULL pointer dereference error.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> ---
>>   sound/soc/soc-pcm.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
>> index 493f003..a7810c7 100644
>> --- a/sound/soc/soc-pcm.c
>> +++ b/sound/soc/soc-pcm.c
>> @@ -1247,6 +1247,8 @@ static void dpcm_be_reparent(struct 
>> snd_soc_pcm_runtime *fe,
>>           return;
>>         be_substream = snd_soc_dpcm_get_substream(be, stream);
>> +    if (!be_substream)
>> +        return;
>>         for_each_dpcm_fe(be, stream, dpcm) {
>>           if (dpcm->fe == fe)
>
>
> Hello,
>
> Could you provide reproduction steps that lead to null-ptr-deref 
> popping up? Also, please drop '.c' in commit title.

Okay will change the comment title.

Actually the issue occurred in internal fuzzing test. and here is the 
crash Report.

/lahaina-asoc-snd soc:qcom,msm-audio-apr:qcom,q6core-audio:sound: ASoC: 
can't get capture BE for TX_AIF3 Capture/
/VoiceMMode1: ASoC: no BE found for TX_AIF3 Capture/
/voc_end_voice_call: Error: End voice called in state 0/
/==================================================================/
/Default lsm port/
/BUG: KASAN: null-ptr-deref in dpcm_be_reparent 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1325 
[inline]/
/BUG: KASAN: null-ptr-deref in dpcm_be_disconnect+0x244/0x4ac 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1349/
/Write of size 8 at addr 0000000000000110 by task syz-executor/21515/

/==================================================================/
/Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000110/
/afe_callback: cmd = 0x100fa returned error = 0x3/
/Mem abort info:/
/afe_apr_send_pkt: DSP returned error[ADSP_EUNSUPPORTED]/
/ESR = 0x96000046/
/EC = 0x25: DABT (current EL), IL = 32 bits/
/SET = 0, FnV = 0/
/EA = 0, S1PTW = 0/
/Data abort info:/
/ISV = 0, ISS = 0x00000046/
/CM = 0, WnR = 1/
/user pgtable: 4k pages, 39-bit VAs, pgdp=0000000112c90000/
/[0000000000000110] pgd=00000000c97c2003, pud=00000000c97c2003, 
pmd=0000000000000000/
/Internal error: Oops: 96000046 [#1] PREEMPT SMP/
/Modules linked in: wlan(O) rmnet_ctl(O) rmnet_shs(O) rmnet_perf(O) 
gspca_main rmnet_core(O) sdhci_msm radio_i2c_rtc6226_qca machine_dlkm 
swr_haptics_dlkm swr_dmic_dlkm wcd938x_slave_dlkm wcd938x_dlkm mbhc_dlkm 
wcd9xxx_dlkm bt_fm_slim btpower tx_macro_dlkm rx_macro_dlkm 
va_macro_dlkm wsa_macro_dlkm swr_ctrl_dlkm bolero_cdc_dlkm wsa883x_dlkm 
wcd_core_dlkm stub_dlkm hdmi_dlkm swr_dlkm pinctrl_lpi_dlkm 
pinctrl_wcd_dlkm native_dlkm platform_dlkm q6_dlkm adsp_loader_dlkm 
apr_dlkm snd_event_dlkm q6_notifier_dlkm q6_pdr_dlkm/
/afe_loopback: AFE loopback failed -95/
/CPU: 4 PID: 21515 Comm: syz-executor Tainted: G S B W O 
5.4.24-qgki-debug-ga12050df #1/
/Hardware name: Qualcomm Technologies, Inc. LahainaP MTP (DT)/
/pstate: 60400005 (nZCv daif +PAN -UAO)/
/pc : dpcm_be_reparent 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1325 
[inline]/
/pc : dpcm_be_disconnect+0x244/0x4ac 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1349/
/lr : dpcm_be_reparent 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1325 
[inline]/
/lr : dpcm_be_disconnect+0x244/0x4ac 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1349/
/sp : ffffff8062c3f970/
/x29: ffffff8062c3f9b0 x28: 000000000000052a/
/x27: ffffff8086a18800 x26: 0000000000000000/
/x25: ffffff80a6d7cc28 x24: ffffff80b7d93400/
/x23: ffffff80b7d93418 x22: ffffffd01364c000/
/x21: ffffff8080e83400 x20: ffffff804a658418/
/x19: ffffff8086a1d000 x18: 0000000000000000/
/x17: 0000000000000000 x16: 0000000000000000/
/x15: 0000000000000000 x14: 1ffffff018766ecc/
/x13: f3f3f300f1f1f1f1 x12: dfffffd000000000/
/x11: dfffffd000000000 x10: dfffffd000000000/
/x9 : 1af35d1dc23a6c00 x8 : 1af35d1dc23a6c00/
/afe_callback: cmd = 0x100fa returned error = 0x3/
/x7 : 0000000000000000 x6 : ffffff80c54462d4/
/afe_apr_send_pkt: DSP returned error[ADSP_EUNSUPPORTED]/
/x5 : 0000000000000000 x4 : 0000000000000000/
/x3 : ffffffd0102c5454 x2 : 0000000000000000/
/x1 : 0000000000000000 x0 : ffffff8037188040/
/Call trace:/
/dpcm_be_reparent 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1325 
[inline]/
/dpcm_be_disconnect+0x244/0x4ac 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:1349/
/dpcm_fe_dai_close+0x2f8/0x388 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/soc/soc-pcm.c:3232/
/snd_pcm_release_substream+0x21c/0x2b4 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/core/pcm_native.c:2447/
/snd_pcm_release+0x5c/0xd0 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/sound/core/pcm_native.c:2623/
/__fput+0x180/0x3b8 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/fs/file_table.c:280/
/____fput+0x1c/0x28 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/fs/file_table.c:313/
/task_work_run+0xf8/0x124 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/kernel/task_work.c:113/
/tracehook_notify_resume 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/include/linux/tracehook.h:188 
[inline]/
/do_notify_resume+0xe7c/0xf08 
local/mnt/workspace/lnxbuild/project/snap_trees_in_use/free_tree_dir/checkout/kernel/msm-5.4/arch/arm64/kernel/signal.c:929/
/work_pending+0x8/0x14/
/Code: 97b3a26e f9408ab5 91044340 97b3a291 (f9008b55)/
/---[ end trace c9e29b4642e01da3 ]---/

>
> Regards,
> Czarek
