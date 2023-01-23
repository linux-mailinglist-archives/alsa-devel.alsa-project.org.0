Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C5B67767D
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 09:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 977A141E8;
	Mon, 23 Jan 2023 09:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 977A141E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674463247;
	bh=HZp7TPcZNFB0PKLd7R3B7j6TFwbn5nN2ofKfOYQ2yFg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hW6DwFgrbJ9GV5jB2arAkzkvIea+omgu3Vzn9kjIamhSVkVNZWTC3KEhlpEusoYsA
	 4tk8pWAIuS3/iwMPsQ7YRhlhjNZ91OEGUKoPwTn+DRo0A7eK5DsdB6qwQIxKVk85x1
	 tWnRqCEB8NWmbFyLmBefyGyG61E3aayMCw6bRw7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B8D7F80132;
	Mon, 23 Jan 2023 09:39:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 815A8F804C2; Mon, 23 Jan 2023 09:39:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39375F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 09:39:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39375F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=axis.com header.i=@axis.com
 header.a=rsa-sha256 header.s=axis-central1 header.b=WDLlxh4o; 
 dkim=pass (1024-bit key,
 unprotected) header.d=axis365.onmicrosoft.com
 header.i=@axis365.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-axis365-onmicrosoft-com header.b=WPdkBn9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674463176;
 x=1705999176; h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PeloGGyqNdF2kMvTG+QJgjifrzSH/LMehnXbS4DzgKg=;
 b=WDLlxh4oCSbumoN7L+8ELFkl+Epta1QBV/WFSRpRN43QS7PuEtEMdkkd
 Uv1MqYg6bNag5BylqiclctomhNFj7O+Me7lvG2U/2vASVSpw4uk2dVclb
 ueQ93HR3V0SmBASN/WtmqtifgCQW0pyJ9UX4HrdSHiM4TNfpEwm3syByS
 qtu3HhIb2auDTYAWL85Jp/+43UkryZo++7XaW8OgGlLBW0eTa1n6BZuy3
 bLvGDD+fIBe9Na5qW/qIKxZitySIizDCpZlVAIzojf/V0r7oxAoF7F5UT
 LeAFjKrybKR7ya1YMAZbr9RHXkDJefekuMN4QNE9jirP+BlU9mLltwmy6 Q==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsSeDk3xxUYWS+CU6/hQ7cZKQKfX//n/FV+YF+Tt7qEdLJ58QR5OPev12caVyDgmkF9suay8+ucp/9dVmuCFJKGzUJHZIX1yd7i5uiZ8PW2wg8JKew2xatk0RGYJdurX60hIuMUBNGW8TYJUHoKozLIHKTEZGSPHDcnUmnUkPo1ZC4iZX1TOJwGu9dpbSbHQburn44tY+CutdWw7AXtkkfafWi+XnSOKI5d1MLkF8/JgaW7nxbAYCqfy8wxEYjGDy7xlGcdLGNH1aXotqmiz6z7mpM56xK4JLndDZ7yi5pLtECOi5RpCSk3iFafF2h1HhoDMPbhYulL4MnQTDqjeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeloGGyqNdF2kMvTG+QJgjifrzSH/LMehnXbS4DzgKg=;
 b=RkQ72YHP+dXzSCMPHUARzCjbEUYMWPk1GIeUmvzOVTAtn7Kwf7Z35wgAuh4QW+om7YxXwNOHw3HVEw8i3YeRZfdznhtFycCIfDe993v2EfQBZikLdz1b2LwoIxBSXTg5Y8JSBx5TBj6Q+cV4VbcHO7ebC9kuSiQy5P+pj03mebEWF2cQGoj4nsVhmpnmS/ztlV6FJYaGexf4RmdgY6XSpMVu/fr1YpwoioO3kD74ieH86vSgnkvTeDn+F07CuvAEqXI1iSam85DIjRZe2U58ffBHnHpu3lr9Ar0tXiIJ++Xc84FZ2QSU8FHYWWIqRgl7N+1uoeUUBclsr9V5q0fvhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeloGGyqNdF2kMvTG+QJgjifrzSH/LMehnXbS4DzgKg=;
 b=WPdkBn9C1Xc8Z20GyK2bTrUrmCRVFfm13B7KMSfYH2FFkj9iL+XHn78xkTMi0KJFOyrOMjqd4+aB5zI47afwXwhe4cRvFp2Ub8xeUVuBHU3xYAp0H1QCLHSuuw47U1kWnBovJBMlx/WIor7fUjQKGJQR73IbScAnRc3moPXdR6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Message-ID: <0b0c0030-3587-5501-c7b2-eccbbe4551e0@axis.com>
Date: Mon, 23 Jan 2023 09:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/4] ASoC: dt-bindings: ti, ts3a227e.yaml: add jack-type
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Astrid Rost
 <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Dylan
 Reid <dgreid@chromium.org>
References: <20230120102555.1523394-1-astrid.rost@axis.com>
 <20230120102555.1523394-5-astrid.rost@axis.com>
 <2d05a943-3510-5ee9-9906-247a6344190a@linaro.org>
From: Astrid Rost <astridr@axis.com>
In-Reply-To: <2d05a943-3510-5ee9-9906-247a6344190a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0113.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::19) To DU0PR02MB9467.eurprd02.prod.outlook.com
 (2603:10a6:10:41b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9467:EE_|DU2PR02MB10332:EE_
X-MS-Office365-Filtering-Correlation-Id: be671f4f-2cef-4e89-a0f9-08dafd1d58e8
X-LD-Processed: 78703d3c-b907-432f-b066-88f7af9ca3af,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WEwsdtkKeqn7Q65emE+APSI7JwZlW339hpQrq3fGhhynkIXSj9Em/c7E02esfXt96xcKUUJucydCy0SEMS7OoXSIn+69JDy+ljQpFxeq8e2C2YRyKfGlObQbU8n39vT3f/X6oyc9FKrsW+raA0nWRvY4YEVpuEJihhMLh8hDYRmB6Hb6j5+yC8Fxp8LSK9HZfMW+/rAQXjFjXKFehYpk8rpjbkUFTQget0Hy/mjrY+n3Va6A4WfDIXiL+wkRsGHxWfjQIdXRh9qJ0x81SrujMrxELkUXIuxvfc/Rh8rShAG4dUUs5Mov5mILkYZhCyj72xin5EAXgVAk/q2ldRnDRvimxeWXX8e58PUMfeR0SgyHd+UI0qbpO2rFPGLTkLhdyK8T0hsKpHZnq8EpOioG1CiW62hNcTMFq70wrJaW9jevlk+l2ygHfHsr/wPyrjnkalCjbyP6rmZJUtKAFsxT0K1sE6pzalGQ+TARdRYE0C75zx3pgGMFG19nqGJQveChEYnTAjnYNI4k56byr9pt9AURslWd6q47QQzdsrOCnx4FV+I0rPqk8QDpL9oa9A5MpPSuccE8dw31i84Ra/K6bt+jPgc3EBR/xc7ORRT4Go4mso6inhTsuqjE8R4fiBhaDRzxCTBPFVBXaJoKENKxmue4lTH3psc32Od8ATzEBCGhmBMcJOI45EUJolGBhruRnFOOmIcVHzJJoqnRE36Scc7xlC0/pkjFSwAl3GFLlfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR02MB9467.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(39850400004)(136003)(346002)(451199015)(2616005)(6506007)(6486002)(8676002)(66946007)(4326008)(66476007)(26005)(53546011)(478600001)(66556008)(186003)(6512007)(38100700002)(41300700001)(8936002)(5660300002)(2906002)(110136005)(31686004)(316002)(36756003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU00amVSU25SYWZJZTNZakRrS3ZRd0htMmJwWEhSRkw1REQvaUZ3YmZkRjhp?=
 =?utf-8?B?dGZIcVdvN0hKVWZiR3pCWUt4NzcveFpGdkJUT1gyZkpoMVBNSExwd2FTWG15?=
 =?utf-8?B?eUJ5dlhVOGpXN1VHbDFEUVhzR3pxcGJ2bHlWdHNNSlF2S29HOWFkTmxWbHg2?=
 =?utf-8?B?VEhIUUFBNTFDS1lwSFlNZ2thYWU5TlFsQWdQd0FIQ1pyOEJRYlkvdDVMOG5Q?=
 =?utf-8?B?NW4yeHVSSHd6NVEwQkFhRXFpZ2REbWF2YmRvdVpuT3RWVUM1MVpHckkvTWlX?=
 =?utf-8?B?OUFJbDhseUpEQk8wQi9YTkx2aW4xeUFNUjd2RXhmdGpRWFpvQ1JmVldxeTJ4?=
 =?utf-8?B?ZXhoOXRqbXBTVUptYSs3VU44UUxKWlJSdDVEWnIrLzJCdmVzZ094K3Q2VkZP?=
 =?utf-8?B?YlEzTks4aDVmaSt1Y3J3UVByTjEvN0VzQ0JpOUFTTzRIMG9qdlhqY0lYSWpQ?=
 =?utf-8?B?R1pHM3FLNkNnTzZaT1hUUU02RDMxalA0UDVPTkorU3QvOGIycHdEYnBNeHAr?=
 =?utf-8?B?VjRBR2NiaXgzOVhFYmlGMzllNytNcTNMVWJQLzZ2UFlDODdaSFpXamJrZXZa?=
 =?utf-8?B?ejF4SlM1bmdpcEt5K216dzZGSktVRjN5NWtzVzd3dC9xV3JHeUpUaUROMXFx?=
 =?utf-8?B?elNjNGVJU2VZS2dNd2JST2c1djVVVlhONUVJMWxOMTZUMWdQYlFtdWJEMHpm?=
 =?utf-8?B?QmpZQW91MEVTeVhTMk05L1RhR2lYUEpkaXRUR1QzT05YOGQyRlBkZnpMN0Yz?=
 =?utf-8?B?SVBvbVBDMXBpUysweWJkTHczQm1VSmhFNVZlRWNIUHBoUUZPU2lNSndGZVVD?=
 =?utf-8?B?Z28zSUg5NlgzclhpY0dkNUhSdEdTb3FaRkhmTW9LakJ2dVBGcC9IRjF0Qmor?=
 =?utf-8?B?dDVvaHlQWExVNUF2R083YnR3bG56dGNJRGhWamlJL1lzdHVsVFJidGRQN01P?=
 =?utf-8?B?Wk9iMjIzVU9wdjdxY3lBOWMzY3A3ZFBlOEZmZVBzRHdxdVFTbjF3ODB1QmtC?=
 =?utf-8?B?L3g3K29LRlZaYUVVdFdtdmw3ZE9JbmliVlAvVEF5dU1Ma2JFZDBQcEZlL2ls?=
 =?utf-8?B?T2ZMMjBZM3kyc1FGVHZrUXZyTS94US9Gd2RrK0Q0aTFqZDhMclFQVXZtNlFY?=
 =?utf-8?B?d04ySGs1a2M1dG9UUnhmdlVzVFBwWEFmdlFNaTBDd0tDaTN5ZFdneTR2dE1k?=
 =?utf-8?B?VmFySXl0VmxuaFVpcmliMEZhN0Q0dDJXWkwrMlp3YXptZDVHNENZUUZvNmZ0?=
 =?utf-8?B?dytLaEdwNmtZci9vVzFQMUd1NzlRNWVKU296ZU5EclFEa0F3R2dmRFd3ditE?=
 =?utf-8?B?T2tnQy93TmM0anZHMFdueVMyc3hiT0xYMVkrakZWeGp3eVlydzdRcUVLUmZI?=
 =?utf-8?B?U3liV0FUK1gzWEZ5OFYxVFBTOHNKMWJocVJubGxEZ1VTdlZHaWhQSmF2K2R6?=
 =?utf-8?B?dnF6eTEyUDU5MzMzaExyR3FhdXFlVHliSVZVUkwwVlRCMkplMUpKbDhRcTJk?=
 =?utf-8?B?K2pWK0gwc0JEbmtXdjE0MkNXczlvTUZmd0orU2ZGUUdLQUxIVzdySGxEbnhK?=
 =?utf-8?B?bzdxYnBWUXBmcnFFSjFqU3Fzc2NxZkVaSTZNcGpzTys0dSs2YlQxV2ZLaDBz?=
 =?utf-8?B?NG1KWitQOE5rbXZuSS9VL3VpdnVJNDJpMjhYSC92ZllwUlkzemZIYlhaMlEw?=
 =?utf-8?B?NUdMMUY2RmROQThGQ2N4ekRmTjRTMmJvUEcwaXhWazVBbE16Q0UzTHp2WGZ4?=
 =?utf-8?B?ZnJGUTFNbkZwYk9jMEw1YjdON1FuQko0SXBjZ0tkaXRTL2VoRGptbytIY0Rs?=
 =?utf-8?B?REpKSkQwY3h2MS9WKzdOUEQzaERoZGFQWUphRDN5cDdCRGlha3NtN1BTVXlh?=
 =?utf-8?B?SGthMHNjY3VSUnJWWXhNMkFYNFNXaG9xQXBpTGRyNS9LVHZXNERjZjBHWEFn?=
 =?utf-8?B?SEgweVdhM0U4ZkRURjNEYnQ3ZklBeXZXRVBYOEFXTmRqdDJaMTVoRU1UUXVi?=
 =?utf-8?B?Zk5uakl6OVJ6WENCOXZiREoxRmhpQXJEbnN1aU13TFhuVWN3YmpBbFNrQng5?=
 =?utf-8?B?ZlBIQjZVZXdmaVExeisyTFhqSXZtelZiTG8yV1VMVHl5NURXY3l5OFMxY0FO?=
 =?utf-8?Q?iUr8tS7Oa9lEPmPRCJoHEVXnP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be671f4f-2cef-4e89-a0f9-08dafd1d58e8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9467.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 08:39:31.5115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlJBUDdw+YsmsbWCTDacJsyesbCPu36xakCaooQZRC4GeEkbwdjpqTeTGbkor51dSWUnCarC2tspFqhrniC6qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10332
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Krzysztof,

On 1/22/23 15:16, Krzysztof Kozlowski wrote:
> On 20/01/2023 11:25, Astrid Rost wrote:
>> Add jack-type: Bitmap value of snd_jack_type to allow combining
>> card drivers to create a jack for it.
> 
> Subject: drop "yaml". We do not filename extensions to subject prefix.
> Nowhere.
> 

yes, true.

>>
>> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
>> ---
>>   Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
>> index 785930658029..1d949b805f98 100644
>> --- a/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
>> +++ b/Documentation/devicetree/bindings/sound/ti,ts3a227e.yaml
>> @@ -27,6 +27,14 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>   
>> +  jack-type:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: Bitmap value of snd_jack_type to allow combining
>> +      card drivers to create a jack for it. Supported is
> 
> Why the device would once support (allow) headphone and once not? Device
> either always supports them or never...
> 

If a device has two connectors (pink and green), one for the microphone 
and one for the headset. It would be easier to see from the available 
events, which is which. But of course it is possible to give it good names.
My first approach was, that it returned all supported types, so no 
devicetree change needed. But by colleges agreed that it would be nice
to remove unused flags. I am happy to remove it and someone who requires 
it can add it.

>> +        1 SND_JACK_HEADPHONE
>> +        2 SND_JACK_MICROPHONE
> 
> minimum and maximum

I do not understand this? It is a bitmap. I can put it as an
enum:
  - 1 # SND_JACK_HEADPHONE
  - 2 # SND_JACK_MICROPHONE
  - 3 # SND_JACK_HEADPHONE | SND_JACK_MICROPHONE
> 
>> +    default: 3
>> +
>>     ti,micbias:
>>       $ref: /schemas/types.yaml#/definitions/uint32
>>       description: Intended MICBIAS voltage (datasheet section 9.6.7).
> 
> Best regards,
> Krzysztof
> 

Thank you for your comments

Astrid
